//
//  rotinView.swift
//  dopamine
//
//  Created by 최시훈 on 6/23/24.
//

import SwiftUI

struct rotinView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 239, green: 238, blue: 246).ignoresSafeArea()

                ScrollView {
                    Image("rotin")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)

                }
                .navigationTitle("건강 도파민 캘린더 📅")
            }
        }
    }
}

#Preview {
    rotinView()
}
