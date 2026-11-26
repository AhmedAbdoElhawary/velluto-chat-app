import SwiftUI

public struct ChatBubble: View {
    let text: LocalizedStringResource
    let isSent: Bool

    public init(_ text: LocalizedStringResource, isSent: Bool = false) {
        self.text = text
        self.isSent = isSent
    }

    public var body: some View {
        AppText.message(text, tone: isSent ? .onAccent : .primary)
            .padding(.vertical, VSpace.s)
            .padding(.horizontal, VSpace.m)
            .background(
                isSent ? .vAccent : .vReceived,
                in: .rect(cornerRadii: RectangleCornerRadii(
                    topLeading: VRadius.bubble,
                    bottomLeading: isSent ? VRadius.bubble : VRadius.bubbleTail,
                    bottomTrailing: isSent ? VRadius.bubbleTail : VRadius.bubble,
                    topTrailing: VRadius.bubble
                ))
            )
            .frame(maxWidth: .infinity, alignment: isSent ? .trailing : .leading)
    }
}
