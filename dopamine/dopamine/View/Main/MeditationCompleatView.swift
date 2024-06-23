//
//  MeditationCompleatView.swift
//  dopamine
//
//  Created by 최시훈 on 6/23/24.
//

import SwiftUI

struct MeditationCompleatView: View {
    @State private var homeButton: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 60) {
                Text("✅\n집중 명상\n20분 완료")
                    .font(.system(size: 24, weight: .semibold))
                    .multilineTextAlignment(.center)
                
                Text("🔼\n건강 도파민 UP!")
                    .font(.system(size: 24, weight: .semibold))
                    .multilineTextAlignment(.center)
                
            }
            .onTapGesture {
                homeButton = true
            }
            .navigationDestination(
                isPresented: $homeButton
            ) {
                MainTabView()
            }
        }
    }
}

#Preview {
    MeditationCompleatView()
}
