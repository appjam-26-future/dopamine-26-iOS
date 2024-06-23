//
//  SurveyView.swift
//  dopamine
//
//  Created by 최시훈 on 6/22/24.
//

import SwiftUI

struct SurveyModel: Hashable {
    let title: String
    let first: String
    let second: String
    let third: String
}

struct SurveyView: View {
    let title: String
    let first: String
    let second: String
    let third: String
    
    @State private var firstButton = false
    @State private var secondButton = false
    @State private var thirdButton = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .padding(.bottom, 10)
            
            Button(action: {
                firstButton.toggle()
                secondButton = false
                thirdButton = false
            }) {
                HStack {
                    Image(firstButton ? "select" : "none")
                    Text(first)
                        .foregroundStyle(.black)
                    Spacer()
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            Button(action: {
                firstButton = false
                secondButton.toggle()
                thirdButton = false
            }) {
                HStack {
                    Image(secondButton ? "select" : "none")
                    Text(second)
                        .foregroundStyle(.black)
                    Spacer()
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            Button(action: {
                firstButton = false
                secondButton = false
                thirdButton.toggle()
            }) {
                HStack {
                    Image(thirdButton ? "select" : "none")
                    Text(third)
                        .foregroundStyle(.black)
                    Spacer()
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.vertical, 20)
    }
}


