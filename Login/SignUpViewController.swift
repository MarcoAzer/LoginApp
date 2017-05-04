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
            errorMessageText = "Please insert your "
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
            ErrorMessage.showError(self, message: errorMessageText, title: "Missing Field!")
        }
        else if !EmailValidation.isValidEmail(email: email){
            errorMessageText = "Please insert a valid email"
            ErrorMessage.showError(self, message: errorMessageText, title: "Invalid Input!")
        }
        else if password != repeatPassword {
            errorMessageText = "Passwords do not match"
            ErrorMessage.showError(self, message: errorMessageText, title: "Mismatch Fields!")
        }
        else{
            ErrorMessage.showError(self, message: "Signing up", title: "")
        }
    }
    
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
