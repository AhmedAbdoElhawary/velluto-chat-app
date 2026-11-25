# 03: Motion & Haptics

Reference: `design/Velluto Motion.dc.html` (frame-by-frame) and `design/Velluto Prototype.dc.html` (live; the side panel logs each motion and haptic). Values are in `VMotion` and `VHaptic` in the kit.

## Principles: "The app breathes"
Alive, never busy.
1. **Springs** are slow and weighted: response 0.35–0.5s, damping 0.82–0.9, no visible overshoot. Default is `VMotion.standard` = `.spring(response: 0.42, dampingFraction: 0.86)`.
2. **One ambient mover per screen**: glow, breathing ring, story sweep or float. Never two.
3. **Every animation means something**: a state change, feedback or presence. Nothing decorative on scroll.
4. **Haptics are light, paired and rare**. They fire only on send, lift, threshold, pick, record and ring.
5. **Reduce Motion**: movement becomes a 0.25s opacity crossfade and ambient motion stops (`VMotion.resolved(_:reduce:)`).

## Ambient (at rest)
| Mover | Spec | Lives on | SwiftUI |
|---|---|---|---|
| Ambient glow | Pearl radial, 420 × 260, ≤16% (dark). Drifts a Lissajous path ±40pt over 16s: x = 40·sin t, y = 20·sin 2t | Chats, Calls, Settings large titles | `VAmbientGlow` ✅ (`TimelineView(.animation)`) |
| Breathing presence | Online ring scale 1.0 → 1.07, opacity .55 → 1, 2s each way, easeInOut, autoreverse | Conversation header only | `VBreathing` ✅ (`phaseAnimator`) |
| Story light sweep | `#F5F4F0` arc (7% of the circle) travels the ring once in 2s, then rests 3s | First unseen ring, Stories tab | `Circle().trim(0, 0.07)` + `.rotationEffect`, `KeyframeAnimator(repeating:)` |
| Empty-state float | Offset y ±4pt, 6s easeInOut, autoreverse | Empty Chats / Calls (replaces the glow) | `PhaseAnimator` + `.offset(y:)` |
| Skeleton pulse | Opacity 0.6 ↔ 1, 1.6s | Loading list | `.phaseAnimator` |

## The 15 interaction moments
| # | Moment | Motion | Haptic | Reduced |
|---|---|---|---|---|
| 01 | **Launch** | Monogram draws on with `trim` 0→1 over 1.1s easeInOut, then dissolves (opacity + scale 1.04, `VMotion.launch` 0.5/0.9) while the chat list rises 8pt | — | Static monogram, 0.3s fade |
| 02 | **Send** | Draft text morphs into the new bubble (`matchedGeometryEffect`) on `VMotion.send` 0.42/0.86. A glint sweeps the bubble once (0.6s easeOut, 0.15s delay, `#F5F4F0` 25%, masked `LinearGradient`) | `VHaptic.onSend` (light) on commit | Bubble fades in place, no glint |
| 03 | **Receive** | Bubble enters at scale 0.92 from bottom-leading + opacity 0.5 → 1 (`VMotion.receiveBubble` 0.45/0.85). The list glides up 12pt (`VMotion.listGlide` 0.45/0.9) | None in foreground | Opacity only |
| 04 | **Read** | Receipt dot fills and scales 1 → 1.5 (0.1s linear), then springs back to 1 (`VMotion.readSettle` 0.35/0.82) | — | Fill crossfade |
| 05 | **Typing** | 3 dots, 1.2s cycle. Each lifts −3pt with opacity .4 → 1 over 0.4s, staggered 0.15s | — | Static, middle dot brighter |
| 06 | **Long-press** | After 0.35s: bubble lifts to scale 1.03 + shadow (`VMotion.lift` 0.38/0.84). Backdrop blurs 6 and dims over 0.25s. The reaction bar's 6 items stagger in 30ms apart (`reactionBarItem` 0.4/0.82). The action menu unfolds. A picked reaction flies to the bubble's corner (`reactionFly` 0.45/0.86) | `VHaptic.onLift` (medium), `VHaptic.onReactionPick` (selection) | Overlay crossfades |
| 07 | **Swipe to reply** | `DragGesture(minimumDistance: 12)`. The bubble follows with resistance: offset = 80·(1 − 1/(dx/160 + 1)). The reply icon fades in and reaches opacity 1 at 56pt, where it bounces. On release it springs back (`swipeRelease` 0.4/0.86) and focuses the composer with a reply quote | `VHaptic.onReplyThreshold` (light), **once** per drag | Icon crossfades, no spring |
| 08 | **Voice recording** | Hold mic: it expands 36 → 64pt (`recordExpand` 0.38/0.84). A halo scales with mic level. A live waveform and timer appear. Slide left with rubber-banding; at −120 it cancels and the trash bounces. Slide up to lock. Releasing snaps back (`recordSnap` 0.45/0.82) and sends | `onRecordStart` (soft), `onRecordCancel` (rigid), `onRecordSend` (success) | Bars update without scale; halo hidden |
| 09 | **Row → conversation** | Push (0.45s). The avatar travels from the row to the header (`avatarTravel` 0.45/0.88, `matchedGeometryEffect` / zoom transition). Bubbles stagger in 20ms apart. Then the header ring starts breathing | — | Standard push, avatar crossfades |
| 10 | **Open story** | Zooms out of the ring into a full-screen card (`storyZoom` 0.5/0.88, `.navigationTransition(.zoom)`). Segments fill linearly, 5s each | — | Crossfade |
| 11 | **Incoming call** | 3 ripple rings: scale 1 → 1.9, opacity .5 → 0, 2.4s easeOut, offset 0.8s apart | `VHaptic.onRingBirth` (soft) at each ring birth | One static ring, opacity pulse |
| 12 | **Active call** | Avatar ring scale = 1 + 0.12·level (`VMotion.callScale`), retargeted at 20 Hz with `callLevel` 0.35/0.9 | — | Ring opacity follows level |
| 13 | **Counts & timers** | Digits roll, never jump: `.contentTransition(.numericText())` on `VMotion.counter` 0.4/0.88. Badge width animates | — | Opacity only |
| 14 | **Icons** | `.symbolEffect(.replace)` for state swaps (bell ↔ bell.slash, mic ↔ send). `.bounce` once on discrete events | `VHaptic.onToggle` (selection) on toggles | Fade only |
| 15 | **Empty states** | One illustration floats ±4pt, 6s | — | Static |

Other transitions from the screens:
- Onboarding page indicator: capsule slides on `.spring(0.4, 0.86)`. The button label crossfades "Continue" → "Get started".
- Sign-in: the button crossfades raised → pearl at 9+ digits. A wrong OTP shakes the row (`KeyframeAnimator`) with `VHaptic.error`.
- Chips in the new-group picker insert with `.scale.combined(with: .opacity)`. The check bounces with `VHaptic.selection`.
- Appearance change: whole-window crossfade 0.35s.
- Storage bars grow from 0 on appear, `.spring(0.5, 0.88)`.
- Video call PiP snaps to the nearest corner, `.spring(0.45, 0.86)`. Chrome auto-hides after 4s.
- Delete message: row collapses, neighbours glide (`listGlide`).
- Dismissing an overlay: opacity + 24pt drop on `.spring(0.45, 0.9)`.

## Haptic map
| Event | `VHaptic` | iOS feedback |
|---|---|---|
| Send message | `onSend` | `.impact(weight: .light)` |
| Long-press lift | `onLift` | `.impact(weight: .medium)` |
| Pick reaction | `onReactionPick` | `.selection` |
| Reply threshold (56pt) | `onReplyThreshold` | `.impact(weight: .light)` |
| Start recording | `onRecordStart` | `.impact(flexibility: .soft)` |
| Cancel recording | `onRecordCancel` | `.impact(flexibility: .rigid)` |
| Send voice note | `onRecordSend` | `.success` |
| Incoming call ring | `onRingBirth` | `.impact(flexibility: .soft)` |
| Toggle / select / check | `onToggle` | `.selection` |
| Wrong OTP, failed send toast | `onWrongCode` / `error` | `.error` |
| Profile done | `success` | `.success` |

Always fire them through `.vHaptic(_:trigger:)`. It checks the Settings → Notifications → **Haptics** toggle (`@AppStorage("velluto.haptics")`).
