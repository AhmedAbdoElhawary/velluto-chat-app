//
//  ProfileSetup.swift
//  Velluto
//
//  Created by ahmed elhawary on 26/11/2026.
//

import SwiftUI
import VellutoKit

struct CodeBoxes: View {
    @Environment(AppRouter.self) private var router
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var code: String = ""
    @State private var wrongAttempts = 0
    @FocusState private var isFocused: Bool

    private let codeLength = 6
    // TODO(ahmed): move this check into your MockAuthRepository behind a VerifyCode ViewModel, the view should not know the right code.
    private let mockCode = "123456"

    var body: some View {

        HStack(spacing: VSpace.s) {
            ForEach(0..<codeLength, id: \.self) { index in
                CodeBox(
                    digit: digit(at: index),
                    isActive: isFocused && index == code.count
                )
            }
        }
        .onAppear { isFocused = true }
        .accessibilityHidden(true)
        .contentShape(.rect)
        .onTapGesture { isFocused = true }
        .overlay {
            TextField(text: $code) {
            }
            .keyboardType(.numberPad)
            .textContentType(.oneTimeCode)
            .focused($isFocused)
            .foregroundStyle(.clear)
            .tint(.clear)
        }

        .environment(\.layoutDirection, .leftToRight)
        .keyframeAnimator(initialValue: CGFloat.zero, trigger: wrongAttempts) {
            [reduceMotion] content, offset in
            content.offset(x: reduceMotion ? 0 : offset)
        } keyframes: { _ in
            KeyframeTrack {
                LinearKeyframe(VMotion.shakeOffset, duration: VMotion.shakeStep)
                LinearKeyframe(
                    -VMotion.shakeOffset,
                    duration: VMotion.shakeStep * 2
                )
                LinearKeyframe(
                    VMotion.shakeOffset / 2,
                    duration: VMotion.shakeStep * 2
                )
                LinearKeyframe(0, duration: VMotion.shakeStep)
            }
        }
        .vHaptic(VHaptic.onWrongCode, trigger: wrongAttempts)
        .onChange(of: code) { _, new in
            let digits = new.compactMap(\.wholeNumberValue).prefix(codeLength)
                .map { String($0) }.joined()
            if digits != new {
                code = digits
                return
            }
            guard digits.count == codeLength else { return }
            if digits == mockCode {
                router.phase = .profileSetup
            } else {
                wrongAttempts += 1
                code = ""
            }
        }
    }

    private func digit(at index: Int) -> String? {
        index < code.count ? String(Array(code)[index]) : nil
    }
}

private struct CodeBox: View {
    let digit: String?
    let isActive: Bool

    var body: some View {
        ZStack {
            if let digit {
                AppText(verbatim: digit, role: .code)
            } else if isActive {
                Capsule()
                    .fill(.vAccent)
                    .frame(width: VSize.caretWidth, height: VSize.caretHeight)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: VSize.codeBox)
        .background(
            .vSurface,
            in: .rect(cornerRadius: VRadius.field, style: .continuous)
        )
        .overlay {
            if isActive {
                RoundedRectangle(
                    cornerRadius: VRadius.field,
                    style: .continuous
                )
                .strokeBorder(.vAccent, lineWidth: VSize.outline)
            }
        }
    }
}

#Preview("Obsidian") {
    CodeBoxes()
        .environment(AppRouter())
        .preferredColorScheme(.dark)
}

#Preview("Pearl") {
    CodeBoxes()
        .environment(AppRouter())
        .preferredColorScheme(.light)
}
