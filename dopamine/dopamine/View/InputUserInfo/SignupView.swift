//
//  SignupView.swift
//  dopamine
//
//  Created by 최시훈 on 6/22/24.
//

import SwiftUI

struct SignupView: View {
    @State private var isSinginButtonPressed: Bool = false
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                SignTitleText(
                    title: "회원가입"
                )
                .padding(.bottom, 98)
                
                CustomSignTextField(
                    text: "이름",
                    placeholder: "이름을 입력해주세요",
                    textfieldValue: $name
                )
                .padding(.bottom, 30)
                
                CustomSignTextField(
                    text: "이메일",
                    placeholder: "이메일를 입력해주세요",
                    textfieldValue: $email
                )
                .padding(.bottom, 30)
                
                CustomSignSecureField(
                    text: "비밀번호",
                    placeholder: "비밀번호를 입력해주세요",
                    textfieldValue: $password
                )
                .padding(.bottom, 30)
                
                Button {
                    isSinginButtonPressed = true
                    
                } label: {
                    Text("로그인하러 가기")
                        .font(.title3)
                        .bold()
                        .frame(width: 342, height: 54)
                        .foregroundStyle(.white)
                        .background(.aqua)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .scaleEffect(isSinginButtonPressed ? 0.95 : 1.0)
                }
                .padding(.bottom, 25)
                .navigationDestination(
                    isPresented: $isSinginButtonPressed
                ) {
                    SigninView()
                }
                .navigationBarBackButtonHidden(true)
                
            }
            .padding()
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
#Preview {
    SignupView()
}
