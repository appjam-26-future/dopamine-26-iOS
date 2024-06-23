//
//  ConnectDataView.swift
//  dopamine
//
//  Created by 최시훈 on 6/23/24.
//

import SwiftUI
import DeviceActivity
import FamilyControls
import HealthKit

struct ConnectDataView: View {
    @State private var isNextButton: Bool = false
    let deviceActivityCenter = DeviceActivityCenter()
    
    let healthStore = HKHealthStore()

    let read = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!, HKObjectType.quantityType(forIdentifier: .stepCount)!, HKSampleType.quantityType(forIdentifier: .distanceWalkingRunning)!, HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)!])
    let share = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!, HKObjectType.quantityType(forIdentifier: .stepCount)!, HKSampleType.quantityType(forIdentifier: .distanceWalkingRunning)!, HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)!])
    
    @State private var authorizationStatus: ATTrackingManager.AuthorizationStatus = .notDetermined
    private let manager = ATTrackingManager()
    
    @State private var screenTimeToggle: Bool = false
    @State private var healthToggle: Bool = false
    
    
    @StateObject private var authorizationManager = AuthorizationManager()
    @State private var isAppUnlocked = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("과거 생활습관 측정")
                    .font(.system(size: 24, weight: .semibold))
                    .onTapGesture {
                        isNextButton = true
                    }
                    .padding(.top, 30)
                Text("과거 생활 습관을 파악하기 확인하기 위해\n필요한 데이터가 있어요\n\n설정 권한을 허용해 주세요")
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14, weight: .regular))
                    .padding(.top, 20)
                
                Text("평균 핸드폰 사용시간")
                    .font(.system(size: 17, weight: .semibold))
                    .padding(.top, 72)
                
                HStack {
                    Image("screenTime")
                        .shadow(radius: 10)

                    
                    Toggle(isOn: $screenTimeToggle, label: {
                        VStack(alignment: .leading) {
                            Text("스크린타임")
                                .font(.system(size: 14, weight: .semibold))
                            Text("과거 1개월과 앞으로의 스크린타임\n데이터를 확인해요")
                                .font(.system(size: 13, weight: .regular))
                                .padding(.top, 10)
                        }
                        .padding(.leading, 15)
                    })
                    .onChange(of: screenTimeToggle, {
                        requestScreenTimePermission()
                        
                        ScreenTimeManager.shared.fetchScreenTimeData { screenTimeData in
                            print("Screen Time Data: \(screenTimeData)")
                        }
                    })
                    .onAppear {
                        checkScreenTimePermission()
                    }
                    Spacer()
                }
                .padding(.top, 27)
                .padding(.leading, 32)
                
                Text("평균 핸드폰 사용시간")
                    .font(.system(size: 17, weight: .semibold))
                    .padding(.top, 72)
                
                
                HStack {
                    Image("health")
                        .shadow(radius: 10)

                    
                    Toggle(isOn: $healthToggle, label: {
                        VStack(alignment: .leading) {
                            Text("건강")
                                .font(.system(size: 14, weight: .semibold))
                            Text("운동, 걸음수, 심박수 데이터를\n 확인해요")
                                .font(.system(size: 13, weight: .regular))
                                .padding(.top, 10)
                        }
                        .padding(.leading, 15)
                    })
                    .onChange(of: healthToggle, {
                        self.healthStore.requestAuthorization(toShare: share, read: read) { (success, error) in
                            if error != nil {
                                print(error?.localizedDescription)
                            } else {
                                if success {
                                    print("권한 허용됨")
                                } else {
                                    print("권한 안 허용됨")
                                }
                            }
                        }
                    })
                    
                    .navigationDestination(
                        isPresented: $healthToggle
                    ) {
                        MainTabView()
                    }
                    Spacer()
                }
                .padding(.top, 27)
                .padding(.leading, 32)
            }
        }
    }
    func checkScreenTimePermission() {
        manager.requestTrackingAuthorization { status in
            DispatchQueue.main.async {
                self.authorizationStatus = status
                handleAuthorizationStatus(status)
            }
        }
    }
    
    func requestScreenTimePermission() {
        manager.requestTrackingAuthorization { status in
            DispatchQueue.main.async {
                self.authorizationStatus = status
                handleAuthorizationStatus(status)
            }
        }
    }
    
    func handleAuthorizationStatus(_ status: ATTrackingManager.AuthorizationStatus) {
        switch status {
        case .authorized:
            // 사용자가 권한을 승인한 경우 처리할 작업
            print("사용자가 Screen Time 권한을 승인했습니다.")
        case .denied:
            // 사용자가 권한을 거부한 경우, 다시 요청하는 방법을 사용자에게 안내할 수 있습니다.
            print("사용자가 Screen Time 권한을 거부했습니다. 다시 요청하는 방법을 사용자에게 안내하세요.")
        case .restricted:
            // 권한이 제한된 경우, 사용자에게 제한 사유에 대해 안내할 수 있습니다.
            print("사용자가 Screen Time 권한을 제한했습니다. 제한 사유에 대해 사용자에게 안내하세요.")
        case .notDetermined:
            func requestScreenTimeAuthorization(completion: @escaping (Bool) -> Void) {
                AuthorizationCenter.shared.requestAuthorization { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success:
                            print("Screen Time access authorized.")
                            completion(true)
                        case .failure(let error):
                            print("Failed to authorize Screen Time access: \(error.localizedDescription)")
                            completion(false)
                        }
                    }
                }
            }
            print("사용자가 Screen Time 권한을 아직 결정하지 않았습니다. 계속 기다리거나 다시 요청하세요.")
        }
    }
}

#Preview {
    ConnectDataView()
}
