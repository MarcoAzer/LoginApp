//
//  EmailValidation.swift
//  Login
//
//  Created by Marco Azer on 2017-05-04.
//
//

import Foundation

class EmailValidation: Any {
    static func isValidEmail(email: String)->Bool {
    // RegEx Source: emailregex.com
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: email)
    }
}
