//
//  DopamineStatusView.swift
//  dopamine
//
//  Created by 최시훈 on 6/23/24.
//

import SwiftUI

struct DopamineStatusView: View {
    @State private var isNextButtonPressed: Bool = false
    var body: some View {
        NavigationStack {
            ScrollView {
                Image("dopamineStatus")
                
                Button {
                    isNextButtonPressed = true
                } label: {
                    Text("다음")
                        .font(.title3)
                        .bold()
                        .frame(width: 342, height: 54)
                        .foregroundStyle(.white)
                        .background(.aqua)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .scaleEffect(isNextButtonPressed ? 0.95 : 1.0)
                }
                .padding(.bottom, 25)
                .navigationDestination(
                    isPresented: $isNextButtonPressed
                ) {
                    ConnectDataView()
                }
            }
        }
    }
}

#Preview {
    DopamineStatusView()
}
