//
//  Welcome1.swift
//  Velluto
//
//  Created by ahmed elhawary on 24/11/2026.
//

import Playgrounds
import SwiftUI

struct Welcome1: View {
    var body: some View {
        WelcomeSkiltone(
            title: AppText.welcome1Title,
            subtitle: AppText.welcome1Subtitle,
            content: VStack {
                Text("Dinner on Friday?")
                    .foregroundColor(.vTextPrimary)
                    .padding(.vertical, AppSpace.s8)
                    .padding(.horizontal, AppSpace.s16)
                    .background(
                        .vReceived,
                        in: .rect(
                            cornerRadii: RectangleCornerRadii(
                                topLeading: AppRadius.s20,
                                bottomLeading: AppRadius.s6,
                                bottomTrailing: AppRadius.s20,
                                topTrailing: AppRadius.s20

                            )
                        )
                    )
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )

                Text("Only if it's Volta.")
                    .foregroundColor(.vOnAccent)
                    .padding(.vertical, AppSpace.s8)
                    .padding(.horizontal, AppSpace.s16)
                    .background(
                        .vAccent,
                        in: .rect(
                            cornerRadii: RectangleCornerRadii(
                                topLeading: AppRadius.s20,
                                bottomLeading: AppRadius.s20,
                                bottomTrailing: AppRadius.s6,
                                topTrailing: AppRadius.s20

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
