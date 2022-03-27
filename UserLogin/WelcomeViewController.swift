//
//  WelcomeViewController.swift
//  UserLogin
//
//  Created by Андрей Барсук on 27.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var logoutButton: UIButton!
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton.layer.cornerRadius = 15
        
        welcomeLabel.text = "Welcome, \(username.capitalized)"
        
    }

}
