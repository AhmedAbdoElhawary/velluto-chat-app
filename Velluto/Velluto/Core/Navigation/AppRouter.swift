//
//  AppRouter.swift
//  Velluto
//
//  Created by ahmed elhawary on 25/11/2026.
//

import Observation

enum AppPhase {
    case splash, onBoadring, auth, main
}

@Observable final class AppRouter {
    var phase: AppPhase = .splash
}
