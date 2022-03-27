//
//  ViewController.swift
//  UserLogin
//
//  Created by Андрей Барсук on 27.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    private let username = "user"
    private let password = "password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginButtonPressed() {
        showLoginFailedAlert()
    }
    
    @IBAction func needHintPressed() {
        showAlert(
            with: "Forgot your username?",
            and: """
                 Maybe it is something like:
                 
                 "username"?
                 """
        )
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlert(
            with: "Forgot your password?",
            and: """
                 It might be something like:
                 
                 "password"?
                 """
        )
    }
    

}

// MARK: - Private methods
extension ViewController {
    
    private func showLoginFailedAlert() {
        
        let title = "Login Failed!"
        let message = "Incorrect username or password! Please try again."
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let tryAgainAction = UIAlertAction(title: "Try Again", style: .default) { _ in
            self.passwordField.text = ""
        }
        alert.addAction(tryAgainAction)
        present(alert, animated: true)
    }
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close", style: .cancel)
        
        alert.addAction(closeAction)
        present(alert, animated: true)
    }
}
