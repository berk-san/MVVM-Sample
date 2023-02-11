//
//  HomeViewModel.swift
//  MVVM
//
//  Created by Berk on 11.02.2023.
//

import Foundation

final class HomeViewModel {
    var message: ObservableObject<String?> = ObservableObject(nil)
    
    func getLoggedInUser() {
        let user = NetworkService.shared.getLoggedInUser()
        self.message.value = "Welcome \(user.firstName) \(user.lastName)"
    }
}
