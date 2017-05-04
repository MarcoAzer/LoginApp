//
//  SignUpViewController.swift
//  SundaySchool
//
//  Created by Marco Azer on 2017-04-27.
//
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSecureTextEntryTo(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setSecureTextEntryTo(_ state: Bool){
        passwordTextField.isSecureTextEntry = state
        repeatPasswordTextField.isSecureTextEntry = state
    }
    
    func showError(message: String, title: String){
        let errorMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        errorMessage.addAction(cancelAction)
        self.present(errorMessage, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            usernameTextField.becomeFirstResponder()
        case usernameTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            repeatPasswordTextField.becomeFirstResponder()
        case repeatPasswordTextField:
            repeatPasswordTextField.resignFirstResponder()
            signUp(textField)
        default:
            // Should never happen
            print("Error: Should not happen")
        }
        return false
    }
    
    @IBAction func toggleShowPassword(_ sender: UISwitch) {
        if sender.isOn {
            setSecureTextEntryTo(false)
        }
        else{
            setSecureTextEntryTo(true)
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        let email = emailTextField.text!
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        let repeatPassword = repeatPasswordTextField.text!
        
        var errorMessageText = ""
        
        if email == "" || username == "" || password == "" || repeatPassword == "" {
            errorMessageText = "Please fill in "
            if email == "" {
                errorMessageText += "email"
            }
            else if username == "" {
                errorMessageText += "username"
            }
            else if password == "" {
                errorMessageText += "password"
            }
            else if repeatPassword == "" {
                errorMessageText += "repeated password"
            }
            showError(message: errorMessageText, title: "Missing Fields!")
        }
        else if password != repeatPassword {
            errorMessageText = "Passwords do not match"
            showError(message: errorMessageText, title: "Mismatch Fields!")
        }
        else{
            // TODO
            // Check if username and email are unique
            // Sign Up then open app
            // Print error message if not unique
            print("Signing up")
        }
    }
    
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
