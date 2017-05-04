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
            let errorMessage = UIAlertController(title: "Missing Field!", message: "Please fill in email", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            errorMessage.addAction(cancelAction)
            self.present(errorMessage, animated: true, completion: nil)
        }
        else{
            // TODO
            // Check if email in database, send restore password email
            // Print a success message or failure emssage
            print("Restoring password")
        }
    }
    
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
