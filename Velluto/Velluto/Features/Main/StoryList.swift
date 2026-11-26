//
//  StoryList.swift
//  Velluto
//
//  Created by ahmed elhawary on 26/11/2026.
//

import SwiftUI
import VellutoKit

struct StoryList: View {
    var body: some View {
        Color.vBackground.ignoresSafeArea()
    }
}

#Preview("Obsidian") {
    StoryList()
        .preferredColorScheme(.dark)
}

#Preview("Pearl") {
    StoryList()
        .preferredColorScheme(.light)
}
