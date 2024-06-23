//
//  MainTabView.swift
//  dopamine
//
//  Created by 최시훈 on 6/23/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }
            CalenderView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("분석")
                }
            rotinView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("캘린더")
                }
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "person")
                    Text("마이페이지")
                }
        }
        .font(.headline)
    }
}

#Preview {
    MainTabView()
}
