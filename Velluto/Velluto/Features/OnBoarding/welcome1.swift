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
            title: AppText.welcome1Title,
            subtitle: AppText.welcome1Subtitle,
            content: VStack {
                Text("Dinner on Friday?")
                    .foregroundColor(.vTextPrimary)
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

                Text("Only if it's Volta.")
                    .foregroundColor(.vOnAccent)
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
