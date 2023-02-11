//
//  HomeVC.swift
//  MVVM
//
//  Created by Berk on 11.02.2023.
//

import UIKit

class HomeVC: UIViewController {
    
    let viewModel = HomeViewModel()
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
        viewModel.getLoggedInUser()
    }
    
    private func setupBinders() {
        viewModel.message.bind { [weak self] message in
            self?.label.text = message
        }
    }
}
