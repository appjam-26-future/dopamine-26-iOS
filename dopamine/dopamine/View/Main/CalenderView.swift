//
//  CalenderView.swift
//  dopamine
//
//  Created by 최시훈 on 6/23/24.
//

import SwiftUI

struct CalenderView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 239, green: 238, blue: 246).ignoresSafeArea()

                ScrollView {
                    Image("calender")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .navigationTitle("도파민 현황📈")
            }
        }
    }
}

#Preview {
    CalenderView()
}
