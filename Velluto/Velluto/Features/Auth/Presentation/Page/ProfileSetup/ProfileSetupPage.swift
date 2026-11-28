//
//  ProfileSetup.swift
//  Velluto
//
//  Created by ahmed elhawary on 26/11/2026.
//

import SwiftUI
import VellutoDomain
import VellutoKit

struct ProfileSetupPage: View {
    @Environment(AppRouter.self) private var router
    @State private var name: String = ""
    @State private var about: String = ""
    @State private var isComplete: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: VSpace.xm) {
            AppText.display(Strings.profileSetupTitle)

            AppText.subhead(Strings.profileSetupSubtitle)

            Circle()
                .fill(.vSurface).strokeBorder(.vHairline, lineWidth: 1)
                .frame(width: 120, height: 120)

                .overlay {
                    Image(systemName: VImagePath.person)
                        .font(.system(size: VSize.xxl, weight: .light))
                        .foregroundStyle(.vTextSecondary)

                }
                .overlay(alignment: .bottomTrailing) {

                    Circle()
                        .fill(.vAccent)
                        .frame(width: VSize.xl2, height: VSize.xl2)
                        .overlay {
                            Image(systemName: VImagePath.camera)
                                .fontWeight(.medium)
                                .font(.system(size: VSize.mx, weight: .medium))

                                .foregroundStyle(.vBackground)

                        }

                }
                .frame(maxWidth: .infinity)
                .padding(.vertical)

            VStack(alignment: .leading, spacing: 0) {

                TextField(
                    text: $name,
                    prompt: Text(Strings.profileName, role: .subhead)
                ) {
                }
                .padding(.all, VSpace.m)
                .keyboardType(.namePhonePad)
                .textContentType(.name)
                .tint(.vAccent)
                .onChange(of: name){ _,typedWord in
                    isComplete = !typedWord.isEmpty
                    
                }

                Divider()

                TextField(
                    text: $about,
                    prompt: Text(Strings.profileAbout, role: .subhead)
                ) {
                }
                .padding(.all, VSpace.m)
                .tint(.vAccent)

            }
            .background(.vSurface, in: .rect(cornerRadius: VRadius.button))

            Spacer()

            PrimaryButton(label: Strings.continueText, enable: isComplete) {
                router.phase = .main
            }

        }.frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .padding(.all, VSpace.x24)
        .background(.vBackground)

    }
}

#Preview("Obsidian") {
    ProfileSetupPage()
        .environment(AppRouter())
        .preferredColorScheme(.dark)
}

#Preview("Pearl") {
    ProfileSetupPage()
        .environment(AppRouter())
        .preferredColorScheme(.light)
}
