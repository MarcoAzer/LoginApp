//
//  ForgotPasswordViewController.swift
//  SundaySchool
//
//  Created by Marco Azer on 2017-04-27.
//
//

import UIKit

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        restorePassword(textField)
        return false
    }

    @IBAction func restorePassword(_ sender: Any) {
        let email = emailTextField.text!
        
        if email == "" {
            ErrorMessage.showError(self, message: "Please insert your email", title: "Missing Field!")
        }
        else if !EmailValidation.isValidEmail(email: email){
            ErrorMessage.showError(self, message: "Please insert a valid email", title: "Invalid Input!")
        }
        else{
            // TODO
            // Check if email in database, send restore password email
            // Print a success message or failure emssage
            emailTextField.resignFirstResponder()
            ErrorMessage.showError(self, message: "Restoring password", title: "")
        }
    }
    
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
