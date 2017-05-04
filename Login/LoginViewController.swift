//
//  ViewController.swift
//  SundaySchool
//
//  Created by Marco Azer on 2017-04-25.
//
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.isSecureTextEntry = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField{
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField {
            textField.resignFirstResponder()
            login(textField)
        }
        return false
    }
    
    @IBAction func login(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        if username == "" || password == "" {
            var errorMessageText = "Please insert your "
            if username == "" {
                errorMessageText = "username"
            }
            else if password == "" {
                errorMessageText = "password"
            }
            ErrorMessage.showError(self, message: errorMessageText, title: "Missing Field!")
        }
        else{
            ErrorMessage.showError(self, message: "Logging in", title: "")
        }
    }
    
    @IBAction func toggleShowPassword(_ sender: UISwitch) {
        if sender.isOn {
            passwordTextField.isSecureTextEntry = false
        }
        else{
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

