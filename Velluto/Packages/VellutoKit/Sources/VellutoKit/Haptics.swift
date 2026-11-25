import SwiftUI

public enum VHaptic {
    public static let light: SensoryFeedback = .impact(weight: .light)
    public static let medium: SensoryFeedback = .impact(weight: .medium)
    public static let soft: SensoryFeedback = .impact(flexibility: .soft)
    public static let rigid: SensoryFeedback = .impact(flexibility: .rigid)
    public static let selection: SensoryFeedback = .selection
    public static let success: SensoryFeedback = .success
    public static let error: SensoryFeedback = .error

    public static let onSend = light
    public static let onLift = medium
    public static let onReactionPick = selection
    public static let onReplyThreshold = light
    public static let onRecordStart = soft
    public static let onRecordCancel = rigid
    public static let onRecordSend = success
    public static let onRingBirth = soft
    public static let onToggle = selection
    public static let onWrongCode = error
}

public extension View {
    func vHaptic<T: Equatable>(_ feedback: SensoryFeedback, trigger: T) -> some View {
        modifier(HapticModifier(feedback: feedback, trigger: trigger))
    }
}

private struct HapticModifier<T: Equatable>: ViewModifier {
    /// the Haptics toggle in Settings writes this key
    @AppStorage("velluto.haptics") private var isEnabled = true
    let feedback: SensoryFeedback
    let trigger: T

    func body(content: Content) -> some View {
        content.sensoryFeedback(feedback, trigger: trigger) { _, _ in isEnabled }
    }
}
