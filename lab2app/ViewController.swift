
//
//  ViewController.swift
//  HelloWorld
//
//  Created by Hardikkumar Patel on 2024-01-26.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text
        else {
            return
        }
        
        if email.isEmpty || password.isEmpty {
            // Show error alert for empty fields
            showAlert(message: "Both email and password are required.")
            return
        }
        
        
        // Authenticate against known valid credentials
        if isValidCredentials(email: email, password: password) {
            // Show success alert
            showAlert(message: "Login successful!")
       }
          else {
            // Show failed alert
            showAlert(message: "Invalid email or password. Please try again.")
            // Clear password field on failed attempt
            passwordTextField.text = ""
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.isEnabled = false
        emailErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
    }

    func updateLoginButtonState() {
        loginButton.isEnabled = !(emailTextField.text?.isEmpty ?? true) && !(passwordTextField.text?.isEmpty ?? true)
    }

    @IBAction func emailTextFieldDidChange(_ sender: UITextField) {
        emailErrorLabel.isHidden = sender.text?.isEmpty == false
        updateLoginButtonState()
    }

    @IBAction func passwordTextFieldDidChange(_ sender: UITextField) {
        passwordErrorLabel.isHidden = sender.text?.isEmpty == false
        updateLoginButtonState()
        
    }

    
    func isValidCredentials(email: String, password: String) -> Bool {
        let validCredentials = [
            ("test1@here.com", "password1"),
            ("test2@there.com", "password2")
        ]
        return validCredentials.contains { $0.0 == email && $0.1 == password }
    }
    



    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

