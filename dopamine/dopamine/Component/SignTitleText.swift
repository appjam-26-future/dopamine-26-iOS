//
//  SignTitleText.swift
//  dopamine
//
//  Created by 최시훈 on 6/22/24.
//

import SwiftUI

struct SignTitleText: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 22, weight: .semibold))
                .foregroundStyle(.black)
                .padding(.leading, 34)
            
            Spacer()
        }
    }
}
