//
//  PrimaryButton.swift
//  Velluto
//
//  Created by ahmed elhawary on 26/11/2026.
//
import SwiftUI
import VellutoKit

struct PrimaryButton: View {
    let label: LocalizedStringResource
    let enable: Bool = true
    let onTap: () -> Void
    
    var body: some View {
        AppText.button(label)
            .frame(maxWidth: .infinity)
            .padding(.all, VSpace.m)
            .background(
                .vAccent,
                in: .rect(cornerRadius: VRadius.button)
            )
            .onTapGesture {
                onTap()
            }
    }
}

