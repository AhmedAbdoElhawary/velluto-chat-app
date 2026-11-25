import SwiftUI

public enum VMotion {
    public static let standard = Animation.spring(response: 0.42, dampingFraction: 0.86)
    public static let launch = Animation.spring(response: 0.5, dampingFraction: 0.9)

    public static let launchTrim = 1.1
    public static let reducedFade = 0.25

    public static func resolved(_ animation: Animation, reduce: Bool) -> Animation {
        reduce ? .easeInOut(duration: reducedFade) : animation
    }
}
