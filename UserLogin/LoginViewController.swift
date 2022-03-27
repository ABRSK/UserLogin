//
//  ViewController.swift
//  UserLogin
//
//  Created by Андрей Барсук on 27.03.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    private let username = "user"
    private let password = "pass"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 15
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.username = usernameField.text
    }
    
    @IBAction func loginButtonPressed() {

        if !checkUsername() || !checkPassword() {
            showLoginFailedAlert()
        }
        
    }
    
    @IBAction func needHintPressed() {
        showAlert(
            with: "Forgot your username?",
            and: """
                 Maybe it is something like:
                 
                 "user"?
                 """
        )
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlert(
            with: "Forgot your password?",
            and: """
                 It might be something like:
                 
                 "pass"?
                 """
        )
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameField.text = ""
        passwordField.text = ""
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
    
    private func checkUsername() -> Bool {
        if usernameField.text == username {
            return true
        } else {
            return false
        }
    }
    
    private func checkPassword() -> Bool {
        if passwordField.text == password {
            return true
        } else {
            return false
        }
    }
    
    func textFieldShouldReturn(_ field: UITextField) -> Bool {
        if field.returnKeyType == .next {
            passwordField.becomeFirstResponder()
        } else if field.returnKeyType == .done {
            loginButtonPressed()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        
        return true
    }
    
}
