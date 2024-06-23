//
//  MainView.swift
//  dopamine
//
//  Created by 최시훈 on 6/23/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var firstButton = false
    @State private var secondButton = false
    @State private var thirdButton = false
    @State private var firstNextButton = false
    @State private var secondNextButton = false
    @State private var thirdNextButton = false
    
    let todayMission = [
        todayMissionModel(
            day: "월",
            title: "·핸드폰 : 4시간 30분",
            sub: "·운동하기 : 30분"
        ),
        todayMissionModel(
            day: "화",
            title: "·핸드폰 : 4시간 30분",
            sub: "·명상하기 : 20분"
        ),
        todayMissionModel(
            day: "수",
            title: "·핸드폰 : 4시간 30분",
            sub: "·산책하기 : 2,000보"
        ),
        todayMissionModel(
            day: "목",
            title: "·핸드폰 : 4시간 30분",
            sub: "·친구와의 만남 : 1시간 이상"
        ),
        todayMissionModel(
            day: "금",
            title: "·핸드폰 : 4시간 30분",
            sub: "·운동하기 : 40분"
        ),
        todayMissionModel(
            day: "토",
            title: "·핸드폰 : 4시간 30분",
            sub: "·야외활동 : 2시간 이상"
        ),
        todayMissionModel(
            day: "일",
            title: "·핸드폰 : 4시간 30분",
            sub: "·친구와의 만남 : 1시간 이상"
        )
    ]
    var body: some View {
        List {
            Section(header:
                        VStack(alignment: .leading) {
                Text("AI 추천")
                    .font(.system(size: 15, weight: .regular))
                Text("오늘의 도파민 미션🔥")
                    .font(.system(size: 24, weight: .semibold))
            }) {
                Button {
                    firstNextButton = true
                    firstButton = true
                } label: {
                    HStack {
                        Image(firstButton ? "selected" : "select")
                        VStack(alignment: .leading) {
                            Text("친구와의 만남")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.black)
                            Text("목표 사용 시간 : 1명, 1시간")
                            
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(.aqua)
                        }    
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.black)
                    }
                    .padding(.vertical, 8)
                }
                .navigationDestination(
                    isPresented: $firstNextButton
                ) {
                    MeetFriendView()
                }
                
                Button {
                    secondNextButton = true
                    secondButton = true
                } label: {
                    HStack {
                        Image(secondButton ? "selected" : "select")
                        VStack(alignment: .leading) {
                            Text("명상하기")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.black)
                            Text("목표 명상 시간: 20분")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(.aqua)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.black)

                    }
                    .padding(.vertical, 8)

                }
                .navigationDestination(
                    isPresented: $secondNextButton
                ) {
                    MaditationView()
                }
                
                Button {
                    thirdNextButton = true
                    thirdButton = true
                } label: {
                    HStack {
                        Image(thirdButton ? "selected" : "select")
                        VStack(alignment: .leading) {
                            Text("산책하기")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.black)
                            Text("목표 거리: 2.0Km")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(.aqua)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.black)

                    }
                    .padding(.vertical, 8)

                }
                .navigationDestination(
                    isPresented: $thirdNextButton
                ) {
                    WorkingView()
                }
            }
            
            Section(header:
                        Text("이번주 도파민 미션")
                .font(.system(size: 24, weight: .semibold))
            ) {
                ForEach(todayMission, id: \.self) { list in
                    HStack {
                        Text(list.day)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.aqua)
                        VStack(alignment: .leading) {
                            Text(list.title)
                                .font(.system(size: 12, weight: .regular))
                            Text(list.sub)
                                .font(.system(size: 12, weight: .regular))
                        }
                        Spacer()
                    }
                    .padding(.vertical, 10)

                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct todayMissionModel: Hashable {
    let day: String
    let title: String
    let sub: String
}

#Preview {
    MainView()
}
