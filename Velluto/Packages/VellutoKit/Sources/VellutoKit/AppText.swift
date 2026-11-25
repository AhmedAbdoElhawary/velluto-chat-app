import SwiftUI

/// what the text is, not how it looks
public enum TextRole: CaseIterable {
    case largeTitle, display, headerName, storyCaption, wordmark
    case headline, message, subhead, footnote, caption, button
    case timestamp, timer

    var font: Font {
        switch self {
        case .largeTitle: VType.largeTitle
        case .display: VType.display
        case .headerName: VType.headerName
        case .storyCaption: VType.storyCaption
        case .wordmark: VType.wordmark
        case .headline: VType.headline
        case .message: VType.message
        case .subhead: VType.subhead
        case .footnote: VType.footnote
        case .caption: VType.caption
        case .button: VType.button
        case .timestamp: VType.timestamp
        case .timer: VType.timer
        }
    }

    var tracking: CGFloat {
        switch self {
        case .largeTitle: -0.4
        case .display: -0.3
        case .wordmark: 6
        case .caption: 0.3
        case .timer: 1
        default: 0
        }
    }

    var tone: TextTone {
        switch self {
        case .wordmark, .subhead, .footnote, .caption, .timestamp: .secondary
        default: .primary
        }
    }
}

/// what the text means
public enum TextTone {
    case primary, secondary, accent, onAccent

    var color: Color {
        switch self {
        case .primary: .vTextPrimary
        case .secondary: .vTextSecondary
        case .accent: .vAccent
        case .onAccent: .vOnAccent
        }
    }
}

public struct AppText: View {
    let text: LocalizedStringResource
    let role: TextRole
    let tone: TextTone

    public init(_ text: LocalizedStringResource, role: TextRole = .message, tone: TextTone? = nil) {
        self.text = text
        self.role = role
        self.tone = tone ?? role.tone
    }

    public var body: some View {
        Text(text)
            .font(role.font)
            .tracking(role.tracking)
            .foregroundStyle(tone.color)
    }
}

public extension AppText {
    static func largeTitle(_ text: LocalizedStringResource, tone: TextTone? = nil) -> AppText { AppText(text, role: .largeTitle, tone: tone) }
    static func display(_ text: LocalizedStringResource, tone: TextTone? = nil) -> AppText { AppText(text, role: .display, tone: tone) }
    static func headerName(_ text: LocalizedStringResource, tone: TextTone? = nil) -> AppText { AppText(text, role: .headerName, tone: tone) }
    static func storyCaption(_ text: LocalizedStringResource, tone: TextTone? = nil) -> AppText { AppText(text, role: .storyCaption, tone: tone) }
    static func wordmark(_ text: LocalizedStringResource, tone: TextTone? = nil) -> AppText { AppText(text, role: .wordmark, tone: tone) }
    static func headline(_ text: LocalizedStringResource, tone: TextTone? = nil) -> AppText { AppText(text, role: .headline, tone: tone) }
    static func message(_ text: LocalizedStringResource, tone: TextTone? = nil) -> AppText { AppText(text, role: .message, tone: tone) }
    static func subhead(_ text: LocalizedStringResource, tone: TextTone? = nil) -> AppText { AppText(text, role: .subhead, tone: tone) }
    static func footnote(_ text: LocalizedStringResource, tone: TextTone? = nil) -> AppText { AppText(text, role: .footnote, tone: tone) }
    static func caption(_ text: LocalizedStringResource, tone: TextTone? = nil) -> AppText { AppText(text, role: .caption, tone: tone) }
    static func button(_ text: LocalizedStringResource, tone: TextTone? = .onAccent) -> AppText { AppText(text, role: .button, tone: tone) }
    static func timestamp(_ text: LocalizedStringResource, tone: TextTone? = nil) -> AppText { AppText(text, role: .timestamp, tone: tone) }
    static func timer(_ text: LocalizedStringResource, tone: TextTone? = nil) -> AppText { AppText(text, role: .timer, tone: tone) }
}

#Preview("Obsidian") {
    VStack(alignment: .leading) {
        ForEach(TextRole.allCases, id: \.self) { role in
            AppText("Conversations, kept close.", role: role)
        }
    }
    .padding()
    .background(.vBackground)
    .preferredColorScheme(.dark)
}

#Preview("Pearl") {
    VStack(alignment: .leading) {
        ForEach(TextRole.allCases, id: \.self) { role in
            AppText("Conversations, kept close.", role: role)
        }
    }
    .padding()
    .background(.vBackground)
    .preferredColorScheme(.light)
}
