//
//  ObservableObject.swift
//  MVVM
//
//  Created by Berk on 11.02.2023.
//

import Foundation

final class ObservableObject<T> {
    
    var value: T {
        
        // Whenever value changes, we broadcast a notification to listener
        didSet {
            listener?(value)
        }
    }
    
    // If user count is more than one, listener should be an array like [((T?) -> Void)}?
    private var listener: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping (T) -> Void) {
        listener(value)
        self.listener = listener
    }
}
