//
//  FirstView.swift
//  dopamine
//
//  Created by 최시훈 on 6/22/24.
//

import SwiftUI

struct FirstView: View {
    @State var isSingupButtonPressed: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("Logo")
                    .padding(.top, 253)
                
                Spacer()
                
                Button {
                    isSingupButtonPressed = true
                } label: {
                    Text("회원가입")
                        .font(.title3)
                        .bold()
                        .frame(width: 342, height: 54)
                        .foregroundStyle(.white)
                        .background(.aqua)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .scaleEffect(isSingupButtonPressed ? 0.95 : 1.0)
                }
                .padding(.bottom, 25)
                .navigationDestination(
                    isPresented: $isSingupButtonPressed
                ) {
                    SignupView()
                }
                
                Button {
                    
                } label: {
                    Text("< 이미 계정이 있어요 >")
                        .font(.pretendard(16, weight: .regular))
                        .foregroundStyle(Color(uiColor: .systemGray))
                    
                }
                .padding(.bottom, 16)
                
            }
            .padding()
        }
    }
}

#Preview {
    FirstView()
}
