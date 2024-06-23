//
//  ATTrakingManager.swift
//  dopamine
//
//  Created by 최시훈 on 6/23/24.
//

import Foundation
import FamilyControls

class ATTrackingManager: NSObject {
    enum AuthorizationStatus {
        case notDetermined
        case restricted
        case denied
        case authorized
    }

    typealias AuthorizationHandler = (AuthorizationStatus) -> Void

    func requestTrackingAuthorization(completion: @escaping AuthorizationHandler) {
        AuthorizationCenter.shared.requestAuthorization { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    completion(.authorized)
                case .failure(let error):
                    print("Failed to authorize Screen Time access: \(error.localizedDescription)")
                    completion(.denied)
                }
            }
        }
    }
}
