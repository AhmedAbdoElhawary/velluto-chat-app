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
        VStack(alignment: .leading,spacing:VSpace.s){
            AppText.display(Strings.authTitle)
            
            AppText.subhead(Strings.authSubtitle)

        }.frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .padding(.all,VSpace.l)
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
