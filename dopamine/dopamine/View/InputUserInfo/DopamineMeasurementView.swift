//
//  DopamineMeasurementView.swift
//  dopamine
//
//  Created by 최시훈 on 6/22/24.
//

import SwiftUI

struct DopamineMeasurementView: View {
    @State private var nextButton: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Text("현재 내 도파민 상태는 어떨까?")
                    .font(.system(size: 24, weight: .semibold))
                
                Button {
                    nextButton = true
                } label: {
                    Text("내 도파민 측정하러 가기")
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: 342, height: 54)
                        .foregroundStyle(.white)
                        .background(.aqua)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .scaleEffect(nextButton ? 0.95 : 1.0)
                }
                .padding(.top, 64)
                .padding(.bottom, 25)
                .navigationDestination(
                    isPresented: $nextButton
                ) {
                    DopamineSurveyView()
                }
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(.gray)
                        }
                    }
                }
                )
            }
        }
    }
}

#Preview {
    DopamineMeasurementView()
}
