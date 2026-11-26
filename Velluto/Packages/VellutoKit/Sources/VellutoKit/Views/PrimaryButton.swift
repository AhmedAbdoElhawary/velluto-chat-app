//
//  PrimaryButton.swift
//  Velluto
//
//  Created by ahmed elhawary on 26/11/2026.
//
import SwiftUI

public struct PrimaryButton: View {
    let label: LocalizedStringResource
    let enable: Bool
    let onTap: () -> Void
    public init(
        label: LocalizedStringResource,
        enable: Bool = true,
        onTap: @escaping () -> Void
    ) {
        self.label = label
        self.enable = enable
        self.onTap = onTap
    }
    public var body: some View {
        AppText.button(label, tone: enable ? nil : .secondary)
            .frame(maxWidth: .infinity)
            .padding(.all, VSpace.m)
            .background(
                enable ? .vAccent : .vRaised,
                in: .rect(cornerRadius: VRadius.button)
            )
            .onTapGesture {
                if enable { onTap() }
            }
    }
}
