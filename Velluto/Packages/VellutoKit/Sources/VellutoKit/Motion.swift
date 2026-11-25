import SwiftUI

public enum VMotion {
    public static let standard = Animation.spring(response: 0.42, dampingFraction: 0.86)
    public static let launch = Animation.spring(response: 0.5, dampingFraction: 0.9)

    public static let launchHold = 1.1
    public static let launchWordmarkFade = 0.3
    public static let reducedFade = 0.25
    
    public static let launchReducedFade = 0.3
    public static let launchRise: CGFloat = 8
    public static let launchScale: CGFloat = 1.04

    public static let glowDriftPeriod = 16.0
    public static let glowDriftX: CGFloat = 40
    public static let glowDriftY: CGFloat = 20
    
    public static func resolved(_ animation: Animation, reduce: Bool) -> Animation {
        reduce ? .easeInOut(duration: reducedFade) : animation
    }
}
