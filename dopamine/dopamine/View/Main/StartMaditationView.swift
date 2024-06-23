//
//  StartMaditationView.swift
//  dopamine
//
//  Created by 최시훈 on 6/23/24.
//

import SwiftUI

struct StartMaditationView: View {
    @State private var endMaditation: Bool = false
    var body: some View {
        ZStack {
            Color.aqua.ignoresSafeArea()
            VStack {
                Group {
                    Text("명상 진행 중입니다...")
                        .font(.system(size: 24, weight: .semibold))
                }
                .multilineTextAlignment(.leading)
                .padding(.trailing, 25)
                
                TimerView()
                    .font(.system(size: 22, weight: .regular))
                    .padding(.top, 81)
                
                Button {
                    endMaditation = true
                } label: {
                    Text("명상 종료하기")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.aqua)
                        .frame(width: 171, height: 74)
                        .background(.white)
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.top, 123)
                .navigationDestination(
                    isPresented: $endMaditation
                ) {
                    MeditationCompleatView()
                }
                
            }
        }
        .navigationTitle("오늘의 도파민 미션🔥")  
    }
}

struct TimerView: View {
    @State var timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    @State var selectedTime: Int = 20
    @State var isLabelVisible: Bool = true
    @State var isRunning: Bool = false
    @State var progress: Int = 0
    @State var startTime: Date?
    @State var isPickerVisible: Bool = false
    @State var isPickerHidden: Bool = true
    @State var percentage: CGFloat = 1.0
    
    var body: some View {
        
            ZStack {
                VStack {
                    Group {
                        if !isRunning {
                            
                        } else {
                            Text({ () -> String in
                                let time = selectedTime * 60 - progress
                                let minute = (time % 3600) / 60
                                let seconds = time % 60
                                return String(format: "%02d:%02d", minute, seconds)
                            }())
                            .font(.system(size: 56, weight: .semibold))
                            .foregroundColor(.white)
                        }
                    }
                    .frame(width: 200, height: 30)
                    Button(action: {
                        if isRunning {
                            progress = 0 // 일시정지할 때 타이머와 진행률 초기화
                            withAnimation(.default) {
                                percentage = 1
                            }
                            timer.upstream.connect().cancel()
                        } else {
                            timer = Timer.publish(every: 0.1, on: .current, in: .common).autoconnect()
                        }
                        isRunning.toggle()
                    }) {
                        Image(systemName: isRunning ? "pause" : "play.fill")
                            .font(.headline)
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .frame(width: 90, height: 90, alignment: .center)
                }
            }
            .onReceive(timer) { _ in
                progress += 1
                withAnimation(.default) {
                    let seconds = selectedTime * 60
                    let time = seconds - progress
                    percentage = CGFloat(time) / CGFloat(seconds)
                    
                    if percentage <= 0 { // 타이머 끝났을 때
                        progress = 0
                        percentage = 1
                        timer.upstream.connect().cancel()
                        
                    }
                }
            }
            .onAppear {
                timer.upstream.connect().cancel()
            }
        }
    }


#Preview {
    StartMaditationView()
}
