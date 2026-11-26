//
//  MainTabs.swift
//  Velluto
//
//  Created by ahmed elhawary on 26/11/2026.
//

import SwiftUI
import VellutoKit

struct MainTabs: View {
    var body: some View {
        TabView {
            Tab(Strings.tabChats, systemImage: "bubble.left.and.bubble.right") {
                NavigationStack { ChatList() }
            }
            Tab(Strings.tabStories, systemImage: "circle.dashed") {
                NavigationStack { StoryList() }
            }
            Tab(Strings.tabCalls, systemImage: "phone") {
                NavigationStack { CallHistory() }
            }
            Tab(Strings.tabSettings, systemImage: "gearshape") {
                NavigationStack { SettingsList() }
            }
        }
        .tint(.vAccent)
    }
}

#Preview("Obsidian") {
    MainTabs()
        .preferredColorScheme(.dark)
}

#Preview("Pearl") {
    MainTabs()
        .preferredColorScheme(.light)
}
