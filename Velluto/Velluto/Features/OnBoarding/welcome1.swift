//
//  Welcome1.swift
//  Velluto
//
//  Created by ahmed elhawary on 24/11/2026.
//

import Playgrounds
import SwiftUI
import VellutoKit

struct Welcome1: View {
    var body: some View {
        WelcomeSkiltone(
            title: Strings.welcome1Title,
            subtitle: Strings.welcome1Subtitle,
            content: VStack {
                AppText.message(Strings.welcome1Bubble1)
                    .padding(.vertical, VSpace.s)
                    .padding(.horizontal, VSpace.m)
                    .background(
                        .vReceived,
                        in: .rect(
                            cornerRadii: RectangleCornerRadii(
                                topLeading: VRadius.bubble,
                                bottomLeading: VRadius.bubbleTail,
                                bottomTrailing: VRadius.bubble,
                                topTrailing: VRadius.bubble

                            )
                        )
                    )
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )

                AppText.message(Strings.welcome1Bubble2, tone: .onAccent)
                    .padding(.vertical, VSpace.s)
                    .padding(.horizontal, VSpace.m)
                    .background(
                        .vAccent,
                        in: .rect(
                            cornerRadii: RectangleCornerRadii(
                                topLeading: VRadius.bubble,
                                bottomLeading: VRadius.bubble,
                                bottomTrailing: VRadius.bubbleTail,
                                topTrailing: VRadius.bubble

                            )
                        )
                    )
                    .frame(
                        maxWidth: .infinity,
                        alignment: .trailing
                    )
            }

        )

    }
}
