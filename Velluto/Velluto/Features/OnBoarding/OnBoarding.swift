//
//  Welcome1.swift
//  Velluto
//
//  Created by ahmed elhawary on 24/11/2026.
//

import SwiftUI
import VellutoKit

struct OnBoarding: View {
    @State var page: Int = 0
    var body: some View {
        VStack {
            AppText.message(Strings.skip, tone: .secondary)
                .frame(
                    maxWidth: .infinity,
                    alignment: .trailing
                )
                .padding(.horizontal, VSpace.l)

            TabView(selection: $page) {
                Welcome1().tag(0)
                Welcome2().tag(1)
                Welcome3().tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

            //
            VStack {
                HStack {
                    ForEach(0..<3) { i in
                        Capsule()
                            .frame(width: i == page ? 20 : 6, height: 6)
                            .foregroundColor(i == page ? .vAccent : .vHairline)
                    }
                }.frame(
                    maxWidth: .infinity,
                    alignment: .leading
                ).padding(.bottom, VSpace.m)
                    .animation(.spring, value: page)

                //
                AppText.button(Strings.continueText, tone: .onAccent)
                    .frame(maxWidth: .infinity)
                    .padding(.all, VSpace.m)
                    .background(
                        .vAccent,
                        in: .rect(cornerRadius: VRadius.button)
                    )
                    .onTapGesture {
                        if page < 2 {
                            withAnimation { page += 1 }
                        }
                    }
            }.padding(.horizontal, VSpace.l)

        }.backgroundStyle(.vBackground)
            .padding(.vertical, VSpace.l)

    }
}

#Preview {
    OnBoarding()
}
