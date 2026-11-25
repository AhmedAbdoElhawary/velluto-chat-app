import SwiftUI

/// text styles, not fixed sizes, so every token scales with Dynamic Type
public enum VType {
    public static let largeTitle = Font.system(.largeTitle, design: .serif, weight: .medium)
    public static let display = Font.system(.title, design: .serif)
    public static let headerName = Font.system(.headline, design: .serif)
    public static let storyCaption = Font.system(.title2, design: .serif).italic()

    public static let headline = Font.system(.headline)
    public static let message = Font.system(.callout)
    public static let subhead = Font.system(.subheadline)
    public static let footnote = Font.system(.footnote)
    public static let caption = Font.system(.caption2)
    public static let button = Font.system(.headline)

    public static let timestamp = Font.system(.caption, design: .monospaced)
    public static let timer = Font.system(.body, design: .monospaced)
}

public extension View {
    func vLargeTitle() -> some View { font(VType.largeTitle).tracking(-0.4) }
    func vDisplay() -> some View { font(VType.display).tracking(-0.3) }
    func vCaption() -> some View { font(VType.caption).tracking(0.3) }
    func vTimer() -> some View { font(VType.timer).tracking(1) }
}
