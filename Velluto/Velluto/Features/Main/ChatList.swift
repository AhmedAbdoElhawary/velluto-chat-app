//
//  ChatList.swift
//  Velluto
//
//  Created by ahmed elhawary on 26/11/2026.
//

import SwiftUI
import VellutoKit

struct ChatList: View {
    var body: some View {
        Color.vBackground.ignoresSafeArea()
    }
}

#Preview("Obsidian") {
    ChatList()
        .preferredColorScheme(.dark)
}

#Preview("Pearl") {
    ChatList()
        .preferredColorScheme(.light)
}
