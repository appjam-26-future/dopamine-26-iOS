//
//  DopamineSurveyView.swift
//  dopamine
//
//  Created by 최시훈 on 6/22/24.
//

import SwiftUI

struct DopamineSurveyView: View {
    @State private var isNextButtonPressed: Bool = false

    let list = [
        SurveyModel(
            title: "1. 하루에 커피를 몇 잔 마시나요?",
            first: "마시지 않음",
            second: "1~2잔",
            third: "3잔 이상"
        ),
        SurveyModel(
            title: "2. 몸에 좋지 않은 것을 알면서도 그것을 멈출 수 없나요?",
            first: "그렇지 않다",
            second: "보통이다",
            third: "그렇다"
        ),
        SurveyModel(
            title: "3. 일 평균 스크린 타임은 어떻게 되나요?",
            first: "0~2시간",
            second: "2시간 이상 ~ 5시간 미만",
            third: "5시간 이상"
        ),
        SurveyModel(
            title: "4. 핸드폰 사용 시간을 줄이려고 시도해봤지만 자주 실패하나요?",
            first: "그렇지 않다",
            second: "보통이다",
            third: "그렇다"
        ),
        SurveyModel(
            title: "5. 주에 운동하는 횟수가 어떻게 되나요?",
            first: "0회",
            second: "1~2회",
            third: "3회 이상"
        ),
        SurveyModel(
            title: "6. 한 번 운동할 때 몇 시간 하나요?",
            first: "30분 이하",
            second: "1시간",
            third: "2시간 이상"
        ),
        SurveyModel(
            title: "7. 주에 사람과 약속을 잡는 횟수는 몇 번인가요?",
            first: "0회",
            second: "1~2회",
            third: "3회 이상"
        ),
        SurveyModel(
            title: "8. 식사 시간 혹은 자투리 시간을 자주 폰과 함께 보내나요?",
            first: "그렇지 않다",
            second: "보통이다",
            third: "그렇다"
        ),
        SurveyModel(
            title: "9. 요새 자주 깜빡 깜빡 하나요?",
            first: "그렇지 않다",
            second: "보통이다",
            third: "그렇다"
        ),
        SurveyModel(
            title: "10. 하루 동안 휴대폰이 없이 생활하는 것은 불가능 할 거 같나요?",
            first: "그렇지 않다",
            second: "보통이다",
            third: "그렇다"
        )
    ]
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    ForEach(list, id: \.self) { list in
                        Section {
                            SurveyView(
                                title: list.title,
                                first: list.first,
                                second: list.second,
                                third: list.third
                            )
                            .padding(.leading, 13)
                        }
                        .listRowSeparator(.hidden)
                    }
                    
                    Section {
                        Button {
                            isNextButtonPressed = true
                        } label: {
                            Text("완료")
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
                            DopamineStatusView()
                        }
                    }
                    
                    
                    
                }
                .padding(.top, -10)

            }
            .background(Color(red: 239, green: 238, blue: 246))
            .navigationTitle("도파민 측정하기 🧠")
            .navigationBarTitleDisplayMode(.inline)
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
    DopamineSurveyView()
}
