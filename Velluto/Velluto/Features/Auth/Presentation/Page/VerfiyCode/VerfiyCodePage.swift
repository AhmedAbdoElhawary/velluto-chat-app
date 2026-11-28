//
//  ProfileSetup.swift
//  Velluto
//
//  Created by ahmed elhawary on 26/11/2026.
//

import SwiftUI
import VellutoKit

struct VerfiyCodePage: View {
    @Environment(AppRouter.self) private var router
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var resends = 0
    @State private var secondsLeft = Self.resendSeconds

    private static let resendSeconds = 24

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            AppText.display(Strings.verifyTitle)
                .padding(.bottom, VSpace.xm)

            HStack(alignment: .center, spacing: VSpace.xs) {
                AppText.subhead(Strings.verifySubtitle("+20 109 440 3139"))
                AppText.message(Strings.verifyEdit)
                    .onTapGesture {
                        router.authPath.removeLast()
                    }
            }.padding(.bottom, VSpace.xl)

            CodeBoxes()

            HStack(alignment: .center, spacing: VSpace.xs) {
                if secondsLeft > 0 {
                    AppText.subhead(Strings.verifyResend)
                    AppText(
                        verbatim: Duration.seconds(secondsLeft).formatted(
                            .time(pattern: .minuteSecond)
                        ),
                        role: .timer
                    )
                    .contentTransition(
                        reduceMotion ? .opacity : .numericText(countsDown: true)
                    )
                } else {
                    Button {
                        resends += 1
                    } label: {
                        AppText.subhead(Strings.verifyResendNow, tone: .primary)
                    }
                }
            }.padding(.top, VSpace.xl)

        }.frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .padding(.all, VSpace.x24)
        .background(.vBackground)
        .task(id: resends) {
            secondsLeft = Self.resendSeconds
            while secondsLeft > 0 {
                do { try await Task.sleep(for: .seconds(1)) } catch { return }
                withAnimation(
                    VMotion.resolved(VMotion.counter, reduce: reduceMotion)
                ) {
                    secondsLeft -= 1
                }
            }
        }
    }
}

#Preview("Obsidian") {
    VerfiyCodePage()
        .environment(AppRouter())
        .preferredColorScheme(.dark)
}

#Preview("Pearl") {
    VerfiyCodePage()
        .environment(AppRouter())
        .preferredColorScheme(.light)
}
