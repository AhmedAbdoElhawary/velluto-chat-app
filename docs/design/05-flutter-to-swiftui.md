# 05: Flutter → SwiftUI, a learning guide

You know Flutter. Most ideas carry over and the names change. The biggest mindset shift: **SwiftUI views are cheap value types that describe UI, and SwiftUI owns the state storage.** There's no `build(context)`, no `setState`, no `BuildContext`.

## Mental model
| Flutter | SwiftUI | Note |
|---|---|---|
| `Widget` | `View` (a `struct`) | `body` is your `build` method |
| `StatelessWidget` | `struct X: View` with `let` props | |
| `StatefulWidget` + `State` | `@State private var` inside the view | SwiftUI keeps it alive across re-renders |
| `setState(() => x = 1)` | `x = 1` | Mutating `@State` re-renders automatically |
| Passing a callback to change parent state | `@Binding var x` | Pass with `$x`. A two-way reference |
| `ChangeNotifier` / Riverpod provider | `@Observable final class Store` | Views that read a property re-render when it changes |
| `Provider.of(context)` / `ref.watch` | `@Environment(Store.self) var store` | Inject with `.environment(store)` |
| `InheritedWidget` / `Theme.of(context)` | `@Environment(\.colorScheme)` etc. | |
| `initState` | `.onAppear {}` or `.task {}` | `.task` is async and cancels on disappear |
| `dispose` | `.onDisappear {}` / task cancellation | |
| `FutureBuilder` / `StreamBuilder` | `.task { for await x in stream { … } }` + `@State` | |
| `const` constructors | Not needed | Structs are already cheap |
| `Key` | `.id(…)` / `ForEach(items, id: \.id)` | Identity matters for animations |
| `pubspec.yaml` | Swift Package Manager (File → Add Package Dependencies) | |
| Hot reload | Xcode Previews (`#Preview`) + ⌘R | Previews are the fastest loop |

## Layout
| Flutter | SwiftUI |
|---|---|
| `Column` / `Row` | `VStack` / `HStack` (`spacing:` = gap) |
| `Stack` + `Positioned` | `ZStack`, or `.overlay(alignment:)` / `.background(alignment:)` |
| `Padding` | `.padding(16)` modifier |
| `SizedBox(width:)` | `.frame(width:)` |
| `Expanded` | `.frame(maxWidth: .infinity)` or `Spacer()` |
| `Align` | `.frame(maxWidth: .infinity, alignment: .leading)` |
| `Container(decoration:)` | `.background(RoundedRectangle(…).fill(…))` |
| `ClipRRect` | `.clipShape(RoundedRectangle(cornerRadius:, style: .continuous))` |
| `ListView.builder` | `List` or `ScrollView { LazyVStack }` |
| `GridView` | `LazyVGrid(columns:)` |
| `SafeArea` | Automatic; opt out with `.ignoresSafeArea()` |
| `Scaffold.bottomNavigationBar` (composer) | `.safeAreaInset(edge: .bottom) { Composer() }` |
| `MediaQuery.size` | `GeometryReader` or `.containerRelativeFrame` |
| `LayoutBuilder` | `GeometryReader` / `ViewThatFits` |

**Modifiers are ordered.** `.padding().background()` is not the same as `.background().padding()`. Read them top to bottom as wrapping layers.

## Navigation
| Flutter | SwiftUI |
|---|---|
| `Navigator.push` | `NavigationStack` + `NavigationLink(value:)` + `.navigationDestination(for:)` |
| `GoRouter` paths | `@State var path = NavigationPath()` |
| `BottomNavigationBar` | `TabView` |
| `showModalBottomSheet` | `.sheet(isPresented:)` + `.presentationDetents` |
| `showDialog` / `CupertinoActionSheet` | `.alert` / `.confirmationDialog` |
| Full-screen route | `.fullScreenCover` |
| `Hero` | `.matchedGeometryEffect` (same screen) or `.navigationTransition(.zoom(sourceID:in:))` (push/cover) |

## Animation (Velluto uses these heavily)
| Flutter | SwiftUI |
|---|---|
| `AnimatedContainer` / `AnimatedFoo` | Change state inside `withAnimation(VMotion.standard) { … }`, or `.animation(VMotion.x, value: v)` |
| `SpringSimulation` | `.spring(response:dampingFraction:)`, already in `VMotion` |
| `AnimationController..repeat()` | `.phaseAnimator([…])` or `TimelineView(.animation)` |
| `TweenSequence` | `.keyframeAnimator` |
| `AnimatedSwitcher` | `.transition(…)` on views inserted with `if`, or `.contentTransition` |
| `AnimatedList` | `ForEach` + `.transition(.vReceive)` + `withAnimation` |
| `Ticker` | `TimelineView(.animation)` |
| `CustomPainter` | `Shape` / `Path`, or `Canvas { ctx, size in }` |
| `GestureDetector(onPan…)` | `DragGesture()`, `LongPressGesture`, `MagnifyGesture` |
| `HapticFeedback.lightImpact()` | `.sensoryFeedback(.impact(weight: .light), trigger:)`, via `.vHaptic` |
| `MediaQuery.disableAnimations` | `@Environment(\.accessibilityReduceMotion)` |

Key idea: **you animate state changes, not widgets.** Wrap the mutation in `withAnimation`, and every view that depends on that state animates.

## Packages → Apple frameworks
| Flutter package | iOS |
|---|---|
| `image_picker` | `PhotosPicker` (PhotosUI) |
| `camera` | AVFoundation `AVCaptureSession` |
| `record` / `just_audio` | `AVAudioRecorder` / `AVAudioPlayer` |
| `flutter_callkit_incoming` | CallKit (`CXProvider`) + PushKit (VoIP pushes) |
| `flutter_webrtc` | WebRTC iOS SDK (Swift package) |
| `local_auth` | LocalAuthentication (`LAContext`) |
| `flutter_local_notifications` / FCM | UserNotifications + APNs |
| `connectivity_plus` | Network (`NWPathMonitor`) |
| `shared_preferences` | `@AppStorage` / `UserDefaults` |
| `sqflite` / `hive` / `isar` | SwiftData |
| `flutter_secure_storage` | Keychain |
| `any_link_preview` | LinkPresentation (`LPMetadataProvider`) |
| `open_filex` | QuickLook (`.quickLookPreview`) |
| `skeletonizer` | `.redacted(reason: .placeholder)` |
| `http` / `dio` | `URLSession` + `async/await` |
| `web_socket_channel` | `URLSessionWebSocketTask` |

## Swift language quick hits
- `let` = `final`, `var` = mutable. `struct` is a value type (copied); `class` is a reference type.
- Optionals: `String?`, unwrap with `if let x { }` / `guard let x else { return }` / `x ?? "default"`.
- `enum` with associated values is like a sealed class: `case text(String), photo(URL)`. Use `switch` to match it exhaustively.
- Closures: `{ x in x * 2 }`. A trailing closure lets you write `Button("Send") { send() }`.
- `async/await` and `Task { }` work like Dart's `Future`/`async`. `@MainActor` is the UI thread.
- Protocols are like abstract classes / interfaces. Extensions add methods to existing types (`extension Color { … }`, which is what the kit does).
