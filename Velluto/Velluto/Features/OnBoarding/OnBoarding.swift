//
//  Welcome1.swift
//  Velluto
//
//  Created by ahmed elhawary on 24/11/2026.
//

import SwiftUI

struct OnBoarding: View {
    @State var page: Int = 0
    var body: some View {
        VStack {
            Text(AppText.skip)
                .foregroundColor(.vTextSecondary)
                .frame(
                    maxWidth: .infinity,
                    alignment: .trailing
                )
                .padding(.horizontal, AppSpace.s24)

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
                ).padding(.bottom, AppSpace.s16)
                    .animation(.spring, value: page)

                //
                Text(AppText.continueText)
                    .fontWeight(.semibold)
                    .foregroundColor(.vOnAccent)
                    .frame(maxWidth: .infinity)
                    .padding(.all, AppSpace.s16)
                    .background(
                        .vAccent,
                        in: .rect(cornerRadius: AppRadius.s14)
                    )
                    .onTapGesture {
                        if page < 2 {
                            withAnimation { page += 1 }
                        }
                    }
            }.padding(.horizontal, AppSpace.s24)

        }.backgroundStyle(.vBackground)
            .padding(.vertical, AppSpace.s24)

    }
}

#Preview {
    OnBoarding()
}
