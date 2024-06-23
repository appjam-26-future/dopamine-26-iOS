//
//  WorkingView.swift
//  dopamine
//
//  Created by 최시훈 on 6/23/24.
//

import SwiftUI

struct WorkingView: View {
    @State private var startWork: Bool = false
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 70) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("산책하기👣")
                            .font(.system(size: 24, weight: .semibold))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .multilineTextAlignment(.leading)
                            .padding(.leading, 30)
                        
                        Text("목표 시간 : 1.5Km")
                            .foregroundStyle(.aqua)
                            .font(.system(size: 22, weight: .semibold))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.leading, 30)
                    }
                    Spacer()
                }
                Text("낮 또는 밤에 산책을 해보아요 ")
                    .foregroundStyle(Color(uiColor: .systemGray4))
                    .font(.system(size: 18, weight: .regular))
                
                Text("산책 시작하기 버튼을 눌러\n걸음 수를 측정하여 산책을 인증해 주세요 ")
                    .foregroundStyle(Color(uiColor: .systemGray4))
                    .font(.system(size: 18, weight: .regular))
                    .multilineTextAlignment(.center)
                
                Button {
                    startWork = true
                } label: {
                    Text("산책 시작하기")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(width: 171, height: 74)
                        .background(.aqua)
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .navigationDestination(
                    isPresented: $startWork
                ) {
                    StartingView()
                }
            }
            .navigationTitle("오늘의 도파민 미션🔥")
        }
    }
}

#Preview {
    WorkingView()
}
