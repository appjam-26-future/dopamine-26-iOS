//
//  ScreenTimeManager.swift
//  dopamine
//
//  Created by 최시훈 on 6/23/24.
//

import FamilyControls
import DeviceActivity
import ManagedSettings
import Foundation
import _DeviceActivity_SwiftUI
//
//class ScreenTimeManager {
//    static let shared = ScreenTimeManager()
//    
//    func requestAuthorization(completion: @escaping (Bool) -> Void) {
//        AuthorizationCenter.shared.requestAuthorization { result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success:
//                    completion(true)
//                case .failure(let error):
//                    print("Authorization request error: \(error.localizedDescription)")
//                    completion(false)
//                }
//            }
//        }
//    }
//    
//    func fetchScreenTimeData(completion: @escaping ([String: TimeInterval]) -> Void) {
//            let startDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())!
//            let endDate = Date()
//            
//            // Create a context for app usage data
//        let category: DeviceActivityReport.Category = .app // 예시로 앱 사용 데이터 가져오기
//
//            // Create a DeviceActivityReport instance with the specified context
//            let report = DeviceActivityReport(context: context)
//            
//            // Fetch data using the report instance
//            report.getData(from: startDate, to: endDate) { result in
//                switch result {
//                case .success(let data):
//                    var screenTimeData: [String: TimeInterval] = [:]
//                    
//                    // Process fetched data
//                    for (category, categoryData) in data.categories {
//                        let totalUsageTime = categoryData.totalUsageTime
//                        screenTimeData[category.localizedDescription] = totalUsageTime
//                    }
//                    
//                    // Call completion handler with processed data
//                    completion(screenTimeData)
//                case .failure(let error):
//                    print("Failed to fetch screen time data: \(error)")
//                    completion([:])
//                }
//            }
//        }
//}

struct DeviceActivityReport {
    enum Category {
        case app
        case website
        // 다른 가능한 카테고리들...
        
        var localizedDescription: String {
            switch self {
            case .app:
                return "App"
            case .website:
                return "Website"
            }
        }
    }
    
    // 예시로 getData 메서드 추가
    func getData(from startDate: Date, to endDate: Date, completion: @escaping (Result<[Category: TimeInterval], Error>) -> Void) {
        // 여기에 데이터를 가져오는 로직을 추가해야 함
        // 이 예시에서는 더미 데이터를 사용
        let data: [Category: TimeInterval] = [
            .app: 3600.0, // 1시간
            .website: 1800.0 // 30분
        ]
        completion(.success(data))
    }
}

class ScreenTimeManager {
    static let shared = ScreenTimeManager()
    
    func fetchScreenTimeData(completion: @escaping ([String: TimeInterval]) -> Void) {
        let startDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())!
        let endDate = Date()
        
        // 선택한 카테고리
        let category: DeviceActivityReport.Category = .app // 예시로 앱 사용 데이터 가져오기
        
        // DeviceActivityReport 인스턴스 생성
        let report = DeviceActivityReport()
        
        // 데이터 가져오기
        report.getData(from: startDate, to: endDate) { result in
            switch result {
            case .success(let data):
                var screenTimeData: [String: TimeInterval] = [:]
                
                // 처리된 데이터 딕셔너리에 추가
                for (category, usageTime) in data {
                    screenTimeData[category.localizedDescription] = usageTime
                }
                
                // 완료 처리
                completion(screenTimeData)
            case .failure(let error):
                print("Failed to fetch screen time data: \(error.localizedDescription)")
                completion([:])
            }
        }
    }
}
