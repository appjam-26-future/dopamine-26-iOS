//
//  MaditationView.swift
//  dopamine
//
//  Created by 최시훈 on 6/23/24.
//

import SwiftUI

struct MaditationView: View {
    @State private var startMaditation: Bool = false

    var body: some View {
        VStack(spacing: 50) {
            
                Text("명상하기🧘🏻")
                    .font(.system(size: 24, weight: .semibold))
            .multilineTextAlignment(.leading)
            .padding(.trailing, 25)
            
        Text("목표 시간: 20분")
            .foregroundStyle(.aqua)
            .font(.system(size: 22, weight: .semibold))
            
            Text("조용히 차분한 상태에서\n내 자신을 돌아보는 명상을 해보아요\n오늘의 주제는 ‘회고’입니다")
                .foregroundStyle(Color(uiColor: .systemGray4))
                .font(.system(size: 18, weight: .regular))
            Text("시작 버튼을 누르고 심박수 측정을 통해\n명상 안정화 정도를 확인하세요")
                .foregroundStyle(Color(uiColor: .systemGray4))
                .font(.system(size: 18, weight: .regular))
            
            Button {
                startMaditation = true
            } label: {
                Text("산책 시작하기")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(width: 171, height: 74)
                    .background(.aqua)
                    .multilineTextAlignment(.center)
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .navigationDestination(
                isPresented: $startMaditation
            ) {
                StartMaditationView()
            }
            
            
        }
        .navigationTitle("오늘의 도파민 미션🔥")   
    }
}

#Preview {
    MaditationView()
}
