//
//  Welcome1.swift
//  Velluto
//
//  Created by ahmed elhawary on 24/11/2026.
//

import Playgrounds
import SwiftUI
import VellutoKit

struct Welcome1: View {
    var body: some View {
        WelcomeSkiltone(
            title: Strings.welcome1Title,
            subtitle: Strings.welcome1Subtitle,
            content: VStack {
                ChatBubble(Strings.welcome1Bubble1)
                ChatBubble(Strings.welcome1Bubble2, isSent: true)
            }

        )

    }
}
