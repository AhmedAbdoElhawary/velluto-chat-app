//
//  PhoneSignIn.swift
//  Velluto
//
//  Created by ahmed elhawary on 25/11/2026.
//

import SwiftUI
import VellutoKit

struct PhoneSignIn: View {
    var body: some View {
        AppText.headline(Strings.workInProgress)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.vBackground)
    }
}

#Preview("Obsidian") {
    PhoneSignIn()
        .preferredColorScheme(.dark)
}

#Preview("Pearl") {
    PhoneSignIn()
        .preferredColorScheme(.light)
}
