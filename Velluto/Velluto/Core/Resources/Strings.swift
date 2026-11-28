//
//  Strings.swift
//  Velluto
//
//  Created by ahmed elhawary on 24/11/2026.
//

import Foundation

struct Strings {
    static let splashWordmark = LocalizedStringResource("splash.wordmark", defaultValue: "VELLUTO")

    static let skip = LocalizedStringResource("skip", defaultValue: "Skip")

    static let welcome1Title = LocalizedStringResource("welcome1.title", defaultValue: "Conversations,\nkept close.")
    static let welcome1Subtitle = LocalizedStringResource("welcome1.subtitle", defaultValue: "Messages, voice and calls with the people who matter, in one quiet place.")
    static let welcome1Bubble1 = LocalizedStringResource("welcome1.bubble1", defaultValue: "Dinner on Friday?")
    static let welcome1Bubble2 = LocalizedStringResource("welcome1.bubble2", defaultValue: "Only if it's Volta.")

    static let welcome2Title = LocalizedStringResource("welcome2.title", defaultValue: "Moments that\nfade by morning.")
    static let welcome2Subtitle = LocalizedStringResource("welcome2.subtitle", defaultValue: "Share a photo or a line of text with close friends. Stories disappear after 24 hours.")

    static let welcome3Title = LocalizedStringResource("welcome3.title", defaultValue: "Private,\nwithout effort.")
    static let welcome3Subtitle = LocalizedStringResource("welcome3.subtitle", defaultValue: "Messages and calls are end-to-end encrypted. Only you and the people you talk to can read them.")

    static let continueText = LocalizedStringResource("continue", defaultValue: "Continue")

    static let workInProgress = LocalizedStringResource("placeholder.wip", defaultValue: "Work in progress")

    static let tabChats = LocalizedStringResource("tab.chats", defaultValue: "Chats")
    static let tabStories = LocalizedStringResource("tab.stories", defaultValue: "Stories")
    static let tabCalls = LocalizedStringResource("tab.calls", defaultValue: "Calls")
    static let tabSettings = LocalizedStringResource("tab.settings", defaultValue: "Settings")

    static let authTitle = LocalizedStringResource("auth.title", defaultValue: "Your number")
    static let authSubtitle = LocalizedStringResource("auth.subtitle", defaultValue: "We'll text a six-digit code to confirm it's you.")

    static let verifyTitle = LocalizedStringResource("verify.title", defaultValue: "Enter the code")
    static func verifySubtitle(_ phoneNumber: String) -> LocalizedStringResource {
        LocalizedStringResource("verify.subtitle", defaultValue: "Sent to \(phoneNumber).")
    }
    static let verifyEdit = LocalizedStringResource("verify.edit", defaultValue: "Edit")
    static let verifyResend = LocalizedStringResource("verify.resend", defaultValue: "Resend code in")
    static let verifyResendNow = LocalizedStringResource("verify.resendNow", defaultValue: "Resend code")

    static let profileSetupTitle = LocalizedStringResource("profileSetup.title", defaultValue: "Your profile")
    static let profileSetupSubtitle = LocalizedStringResource("profileSetup.subtitle", defaultValue: "Your name and photo are visible to your contacts.")
    //
    static let numbersExample = LocalizedStringResource("example.number", defaultValue: "104 340 2139")
    static let profileName = LocalizedStringResource("profile.name", defaultValue: "Your name")
    static let profileAbout = LocalizedStringResource("profile.about", defaultValue: "About (optional)")
    static let phoneLabel = LocalizedStringResource("field.phoneLabel", defaultValue: "Phone label")
    //
}
