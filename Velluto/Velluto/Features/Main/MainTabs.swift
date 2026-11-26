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
            Tab(Strings.tabChats, systemImage: VImagePath.chat) {
                NavigationStack { ChatList() }
            }
            Tab(Strings.tabStories, systemImage: VImagePath.story) {
                NavigationStack { StoryList() }
            }
            Tab(Strings.tabCalls, systemImage: VImagePath.call) {
                NavigationStack { CallHistory() }
            }
            Tab(Strings.tabSettings, systemImage: VImagePath.settings) {
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
