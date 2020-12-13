//
//  RegistrationViewController.swift
//  ShchelochowDS_HW2.4
//
//  Created by Дмитрий on 12.12.2020.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registerTapped(_ sender: UIButton) {
        guard
            let name = loginTextField.text,
            let password = passwordTextField.text
            else { return }
        register(name: name, password: password)
    }
    
}

// MARK: User data check and append
extension RegistrationViewController {
    private func register(name: String, password: String){
        if users[name] == nil && !name.isEmpty && !password.isEmpty{
            users.updateValue(password, forKey: name)
            showAlert(title: "Success",
                      message: "You have successfully registered",
                      type: .success)
        } else if users[name] != nil{
            showAlert (title: "Try again",
                       message: "This user name is already taken. Please use different one.",
                       type: .fail)
        } else if name.isEmpty || password.isEmpty {
            showAlert (title: "Try again",
                       message: "Please verify all information you have entered.",
                       type: .fail)
        }
    }
}

// MARK: Alert controllers
extension RegistrationViewController {
    enum typeAlert {
        case success
        case fail
    }
    
    private func showAlert(title: String, message: String, type: typeAlert){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var okAction: UIAlertAction
        
        switch type {
        case .success:
            okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
                        self.dismiss(animated: true, completion: {
                            self.navigationController?.popToRootViewController(animated: true)
                        })
                    })
        case .fail:
            okAction = UIAlertAction(title: "OK", style: .default)
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: Hide keyboard
extension RegistrationViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

// MARK: Keyboard methods
extension RegistrationViewController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
            guard
                let name = loginTextField.text,
                let password = passwordTextField.text
                else { return false }
            register(name: name, password: password)
        }
        return true
    }
}

