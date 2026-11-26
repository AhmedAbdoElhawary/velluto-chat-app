//
//  SettingsList.swift
//  Velluto
//
//  Created by ahmed elhawary on 26/11/2026.
//

import SwiftUI
import VellutoKit

struct SettingsList: View {
    var body: some View {
        Color.vBackground.ignoresSafeArea()
    }
}

#Preview("Obsidian") {
    SettingsList()
        .preferredColorScheme(.dark)
}

#Preview("Pearl") {
    SettingsList()
        .preferredColorScheme(.light)
}
