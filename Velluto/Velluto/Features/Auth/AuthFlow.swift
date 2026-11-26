//
//  AuthFlow.swift
//  Velluto
//
//  Created by ahmed elhawary on 25/11/2026.
//

import SwiftUI

struct AuthFlow: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        @Bindable var router = router

        NavigationStack(path: $router.authPath) {
            OnBoarding()
                .toolbar(.hidden, for: .navigationBar)
                .navigationDestination(for: AuthRoute.self) { route in
                    switch route {
                    case .phoneSignIn: PhoneSignIn()
                    }
                }
        }
    }
}

#Preview("Obsidian") {
    AuthFlow()
        .environment(AppRouter())
        .preferredColorScheme(.dark)
}

#Preview("Pearl") {
    AuthFlow()
        .environment(AppRouter())
        .preferredColorScheme(.light)
}
