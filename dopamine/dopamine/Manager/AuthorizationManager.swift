//
//  AuthorizationManager.swift
//  dopamine
//
//  Created by 최시훈 on 6/23/24.
//

import SwiftUI
import FamilyControls
import ManagedSettings

class AuthorizationManager: ObservableObject {
    @Published var isAuthorized = false
    
    func requestAuthorization() {
        AuthorizationCenter.shared.requestAuthorization { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.isAuthorized = true
                case .failure(let error):
                    print("Authorization request error: \(error.localizedDescription)")
                    self.isAuthorized = false
                }
            }
        }
    }
}
