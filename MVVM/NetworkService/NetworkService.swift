//
//  NetworkService.swift
//  MVVM
//
//  Created by Berk on 11.02.2023.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    // user is going to simulate logged in user
    private var user: User?
    private init() {}
    
    func login(userName: String, password: String, completion: @escaping(Bool) -> Void) {
        
        // In order to simulate network request delay, use dispatchqueue
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if userName == "berksan", password == "123456" {
                self?.user = User(firstName: "Berk", lastName: "San", email: "berksan@berksan.com", userName: "berksan", age: 10)
                completion(true)
            } else {
                self?.user = nil
                completion(false)
            }
        }
    }
    
    func getLoggedInUser() -> User {
        return user!
    }
}
