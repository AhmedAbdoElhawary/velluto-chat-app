import SwiftUI
import VellutoKit

struct SplashView: View {
    let onFinish: () -> Void

    @State private var showWordmark = false

    var body: some View {
        ZStack {
            /// the launch screen centres it on the whole screen, not the safe area, so this must too or it jumps
            Image(.launchMonogram)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()

            AppText.wordmark(Strings.splashWordmark)
                .opacity(showWordmark ? 1 : 0)
                .padding(.bottom, VSpace.x24)
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .background(.vBackground)
        .task {
            withAnimation(.easeOut(duration: VMotion.launchWordmarkFade)) {
                showWordmark = true
            }
            try? await Task.sleep(for: .seconds(VMotion.launchHold))
            onFinish()
        }
    }
}

#Preview("Obsidian") {
    SplashView {}
        .preferredColorScheme(.dark)
}

#Preview("Pearl") {
    SplashView {}
        .preferredColorScheme(.light)
}
