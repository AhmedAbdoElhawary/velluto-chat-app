//
//  Welcome1.swift
//  Velluto
//
//  Created by ahmed elhawary on 24/11/2026.
//

import Playgrounds
import SwiftUI

struct WelcomeSkiltone<Content: View>: View {
    let title: String
    let subtitle: String
    let content: Content

    var body: some View {
        VStack {
            content
                .padding(.horizontal, AppSpace.s24)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .center
                )

            //
            VStack {
                Text(title)
                    .foregroundColor(.vTextPrimary)
                    .font(.system(size: 34))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.trailing, AppSpace.s24)
                    .padding(.bottom, AppSpace.s16)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )

                //
                Text(subtitle)
                    .foregroundColor(.vTextSecondary)
                    .fixedSize(horizontal: false, vertical: true)

                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding(.bottom, AppSpace.s16)

            }.frame(maxHeight: .infinity, alignment: .bottom)

        }.padding(.horizontal, AppSpace.s24)

    }
}
