import SwiftUI

public struct VAmbientGlow: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    public init() {}

    public var body: some View {
        TimelineView(.animation(paused: reduceMotion)) { context in
            let t = reduceMotion ? 0 : context.date.timeIntervalSinceReferenceDate / VMotion.glowDriftPeriod * 2 * .pi

            EllipticalGradient(colors: [
                .vGlow.opacity(colorScheme == .dark ? VOpacity.glow : VOpacity.glowPearl),
                .vGlow.opacity(0),
            ])
            .frame(width: VSize.glowWidth, height: VSize.glowHeight)
            .offset(x: VMotion.glowDriftX * sin(t), y: VMotion.glowDriftY * sin(2 * t))
        }
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}
