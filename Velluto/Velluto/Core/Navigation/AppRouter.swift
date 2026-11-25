//
//  AppRouter.swift
//  Velluto
//
//  Created by ahmed elhawary on 25/11/2026.
//

import Observation

/// the top level screens swap, they are never pushed, so no back swipe between them
enum AppPhase {
    case splash, auth
}

enum AuthRoute: Hashable {
    case phoneSignIn
}

@Observable final class AppRouter {
    var phase: AppPhase = .splash
    var authPath: [AuthRoute] = []
}
