import SwiftUI
import VellutoKit

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var router = AppRouter()

    var body: some View {
        ZStack {
            Color.vBackground.ignoresSafeArea()

            switch router.phase {
            case .splash:
                SplashView {
                    withAnimation(reduceMotion ? .easeInOut(duration: VMotion.launchReducedFade) : VMotion.launch) {
                        router.phase = .auth
                    }
                }
                .transition(reduceMotion ? .opacity : .opacity.combined(with: .scale(scale: VMotion.launchScale)))
                .zIndex(1)
            case .auth:
                /// no fade in, the splash fades out on top, two fades would dim the middle
                AuthFlow()
                    .transition(reduceMotion ? .identity : .offset(y: VMotion.launchRise))
            }
        }
        .environment(router)
    }
}
