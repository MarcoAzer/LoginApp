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
            var errorMessageText = ""
            if username == "" {
                errorMessageText = "Please fill in username"
            }
            else if password == "" {
                errorMessageText = "Please fill in password"
            }
            let errorMessage = UIAlertController(title: "Missing Fields", message: errorMessageText, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            errorMessage.addAction(cancelAction)
            self.present(errorMessage, animated: true, completion: nil)
        }
        else{
            // TODO
            // Login if correct username and password
            // Show error message if failed to login
            print("Logging In")
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

