//
//  ProfileSetup.swift
//  Velluto
//
//  Created by ahmed elhawary on 26/11/2026.
//


import SwiftUI
import VellutoKit
import VellutoDomain

struct ProfileSetup: View {
    @Environment(AppRouter.self) private var router
    @State private var phone: String = ""
    private let format = PhoneFormat.egypt
    private var isComplete: Bool { format.isComplete(phone) }
    
    var body: some View {
        VStack(alignment: .leading,spacing:VSpace.xm){
            AppText.display(Strings.authTitle)
            
            AppText.subhead(Strings.authSubtitle)
            
            VStack(alignment: .leading,spacing: 0){
                HStack{
                    AppText.message("Itely")
                    Spacer()
                    AppText.subhead("+39")
                    
                    Image(systemName: VImagePath.rightArrow)
                        .font(.system(size: VSize.xm, weight: .medium))
                        .foregroundStyle(.vTextSecondary)
                }
                .padding(.all,VSpace.m)
                
                Divider()
                    .frame(height: 0)
                
                HStack{
                    AppText.subhead("+39")
                    
                    Divider()
                        .frame(height: VSpace.x24)
                    
                    TextField(text: $phone, prompt: Text(Strings.numbersExample)) {
                        Text(Strings.phoneLabel)
                    }
                    .keyboardType(.phonePad)
                    .textContentType(.telephoneNumber)
                    .tint(.vAccent)
                    .onChange(of: phone) { _, new in
                        phone = format.formatted(new)
                    }
                }
                .padding(.all,VSpace.m)
              
            }
            .background(.vSurface, in: .rect(cornerRadius: VRadius.button))
            
            Spacer()
            
            PrimaryButton(label: Strings.continueText, enable: isComplete){
                
            }
            
        }.frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .padding(.all,VSpace.x24)
        .background(.vBackground)
        
        
    }
}

//#Preview("Obsidian") {
//    PhoneSignIn()
//        .environment(AppRouter())
//        .preferredColorScheme(.dark)
//}
//
//#Preview("Pearl") {
//    PhoneSignIn()
//        .environment(AppRouter())
//        .preferredColorScheme(.light)
//}
