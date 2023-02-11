//
//  ViewController.swift
//  MVVM
//
//  Created by Berk on 11.02.2023.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    private let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
    }
    
    private func setupBinders() {
        viewModel.error.bind { [weak self] error in
            if let error = error {
                print("Error")
                print(error)
            } else {
                self?.goToHomePage()
            }
        }
    }
    
    private func goToHomePage() {
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        present(homeVC, animated: true)
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let userName = usernameTextfield.text, let password = passwordTextfield.text else { return }
        viewModel.login(userName: userName, password: password)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
