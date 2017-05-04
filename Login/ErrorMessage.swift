//
//  ErrorMessage.swift
//  Login
//
//  Created by Marco Azer on 2017-05-04.
//
//

import Foundation
import UIKit

class ErrorMessage: Any {
    
    static func showError(_ viewController: UIViewController, message: String, title: String){
        let errorMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        errorMessage.addAction(cancelAction)
        viewController.present(errorMessage, animated: true, completion: nil)
    }
    
}
