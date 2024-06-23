//
//  StartingView.swift
//  dopamine
//
//  Created by 최시훈 on 6/23/24.
//

import SwiftUI
import HealthKit

struct StartingView: View {
    @State private var km: Double = 0
    let healthStore = HKHealthStore()
    
    let read = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!, HKObjectType.quantityType(forIdentifier: .stepCount)!, HKSampleType.quantityType(forIdentifier: .distanceWalkingRunning)!, HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)!])
    let share = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!, HKObjectType.quantityType(forIdentifier: .stepCount)!, HKSampleType.quantityType(forIdentifier: .distanceWalkingRunning)!, HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)!])
    
    @State private var endWork: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.aqua.ignoresSafeArea()
                VStack {
                    Text("산책 진행 중입니다...")
                        .font(.system(size: 24, weight: .semibold))
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 25)
                    
                    Text("산책하기👣")
                        .font(.system(size: 22, weight: .regular))
                        .padding(.top, 81)
                    
                    Text(numberFormatter.string(from: NSNumber(value: km)) ?? "0")
                        .font(.system(size: 30, weight: .semibold))
                        .padding(.top, 12)
                    
                    Text("남은 걸음 수")
                        .font(.system(size: 22, weight: .regular))
                        .padding(.top, 71)
                    Text("1.5km")
                        .font(.system(size: 30, weight: .semibold))
                        .padding(.top, 12)
                    
                    Button {
                        endWork = true
                    } label: {
                        Text("산책 종료하기")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.aqua)
                            .frame(width: 171, height: 74)
                            .background(.white)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.top, 123)
                    .navigationDestination(
                        isPresented: $endWork
                    ) {
                        WorkCompleatView()
                    }
                    
                }
            }
            .navigationTitle("오늘의 도파민 미션🔥")
            .onAppear {
                requestAuthorization()
                getDistanceWalkingRunning { distance in
                    self.km = distance
                }
            }
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
    func convertToKilometers(_ miles: Double) -> Double {
        return miles * 1.60934
    }
    
    func getDistanceWalkingRunning(completion: @escaping (Double) -> Void) {
        guard let distanceWalkingRunningType = HKSampleType.quantityType(forIdentifier: .distanceWalkingRunning) else {
            return
        }
        
        let now = Date()
        let startDate = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: distanceWalkingRunningType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, result, error) in
            var distance: Double = 0
            if let result = result, let sum = result.sumQuantity() {
                distance = sum.doubleValue(for: HKUnit.mile())
            } else {
                print("fail")
            }
            DispatchQueue.main.async {
                completion(self.convertToKilometers(distance))
            }
        }
        healthStore.execute(query)
    }
    
    func requestAuthorization() {
        healthStore.requestAuthorization(toShare: share, read: read) { (success, error) in
            if !success {
                print("Authorization failed.")
            }
        }
    }
}

#Preview {
    StartingView()
}
