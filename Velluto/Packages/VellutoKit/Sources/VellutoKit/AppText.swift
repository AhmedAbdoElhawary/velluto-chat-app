import SwiftUI

public struct AppText: View {
    let text: LocalizedStringResource
    let role: TextRole
    let tone: TextTone

    public init(
        _ text: LocalizedStringResource,
        role: TextRole = .message,
        tone: TextTone? = nil
    ) {
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
    static func button(_ text: LocalizedStringResource, tone: TextTone? = nil) -> AppText { AppText(text, role: .button, tone: tone) }
    static func timestamp(_ text: LocalizedStringResource, tone: TextTone? = nil) -> AppText { AppText(text, role: .timestamp, tone: tone) }
    static func timer(_ text: LocalizedStringResource, tone: TextTone? = nil) -> AppText { AppText(text, role: .timer, tone: tone) }
}


public enum TextRole: CaseIterable {
    case largeTitle, display, headerName, storyCaption, wordmark
    case headline, message, subhead, footnote, caption, button
    case timestamp, timer

    var font: Font {
        switch self {
        case .largeTitle:
            Font.system(.largeTitle, design: .serif, weight: .medium)
        case .display: Font.system(.title, design: .serif)
        case .headerName: Font.system(.headline, design: .serif)
        case .storyCaption: Font.system(.title2, design: .serif).italic()
        case .wordmark: Font.system(.footnote, design: .serif)

        case .headline: Font.system(.headline)
        case .message: Font.system(.callout)
        case .subhead: Font.system(.subheadline)
        case .footnote: Font.system(.footnote)
        case .caption: Font.system(.caption2)
        case .button: Font.system(.headline)

        case .timestamp: Font.system(.caption, design: .monospaced)
        case .timer: Font.system(.body, design: .monospaced)
        }
    }
    // no need to be public and any one change it
    internal var tracking: CGFloat {
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
        case .button:.onAccent
        default: .primary
        }
    }
}

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
