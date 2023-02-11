//
//  LoginViewModel.swift
//  MVVM
//
//  Created by Berk on 11.02.2023.
//

import Foundation

final class LoginViewModel {
    
    // If login function fails this error message will be shown
    var error: ObservableObject<String?> = ObservableObject(nil)
    
    // This login function is going to be called by LoginVC
    // This login function is bridging textfields on the screen to NetworkService's login function
    func login(userName: String, password: String) {
        NetworkService.shared.login(userName: userName, password: password) { [weak self] success in
            
            // if success == true { error.value = nil } else { error.value = "Invalid Credentials"
            self?.error.value = success ? nil : "Invalid Credentials"
        }
    }
}
