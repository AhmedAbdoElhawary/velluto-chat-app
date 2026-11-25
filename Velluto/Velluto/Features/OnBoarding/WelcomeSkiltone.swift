//
//  Welcome1.swift
//  Velluto
//
//  Created by ahmed elhawary on 24/11/2026.
//

import Playgrounds
import SwiftUI
import VellutoKit

struct WelcomeSkiltone<Content: View>: View {
    let title: LocalizedStringResource
    let subtitle: LocalizedStringResource
    let content: Content

    var body: some View {
        VStack {
            content
                .padding(.horizontal, VSpace.l)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .center
                )

            //
            VStack {
                AppText.display(title)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.trailing, VSpace.l)
                    .padding(.bottom, VSpace.m)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )

                //
                AppText.subhead(subtitle)
                    .fixedSize(horizontal: false, vertical: true)

                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding(.bottom, VSpace.m)

            }.frame(maxHeight: .infinity, alignment: .bottom)

        }.padding(.horizontal, VSpace.l)

    }
}
