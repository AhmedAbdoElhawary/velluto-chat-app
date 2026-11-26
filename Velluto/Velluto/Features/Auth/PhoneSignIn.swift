//
//  PhoneSignIn.swift
//  Velluto
//
//  Created by ahmed elhawary on 25/11/2026.
//

import SwiftUI
import VellutoKit

struct PhoneSignIn: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        Button {
            withAnimation(.easeInOut(duration: VMotion.reducedFade)) {
                router.phase = .main
            }
        } label: {
            AppText.headline(Strings.workInProgress)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.vBackground)
    }
}

#Preview("Obsidian") {
    PhoneSignIn()
        .environment(AppRouter())
        .preferredColorScheme(.dark)
}

#Preview("Pearl") {
    PhoneSignIn()
        .environment(AppRouter())
        .preferredColorScheme(.light)
}
