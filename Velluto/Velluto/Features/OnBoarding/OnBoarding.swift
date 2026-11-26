//
//  Welcome1.swift
//  Velluto
//
//  Created by ahmed elhawary on 24/11/2026.
//

import SwiftUI
import VellutoKit

struct OnBoarding: View {
    @Environment(AppRouter.self) private var router
    @State var page: Int = 0
    var body: some View {
        VStack {
            Button {
                router.phase = .auth
            } label: {
                AppText.subhead(Strings.skip)
            }
            .frame(
                maxWidth: .infinity,
                alignment: .trailing
            )
            .padding(.horizontal, VSpace.x24)

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
                PrimaryButton(label: Strings.continueText){
                    if page < 2 {
                        withAnimation { page += 1 }
                    } else {
                        router.phase = .auth
                    }
                }
            }.padding(.horizontal, VSpace.x24)

        }
        .padding(.vertical, VSpace.x24)
        .background(.vBackground)

    }
}

#Preview {
    OnBoarding()
        .environment(AppRouter())
}
