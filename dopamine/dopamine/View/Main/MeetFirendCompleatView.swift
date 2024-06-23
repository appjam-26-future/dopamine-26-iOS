//
//  MeetFirendCompleatView.swift
//  dopamine
//
//  Created by 최시훈 on 6/23/24.
//

import SwiftUI

struct MeetFirendCompleatView: View {
    @State private var homeButton: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 60) {
                Text("✅\nAI 인증 완료!")
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
    FirstView()
}
