//
//  LoginViewController.swift
//  ShchelochowDS_HW2.4
//
//  Created by Apple on 11.12.2020.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!

    @IBAction func loginTapped(_ sender: UIButton) {
        guard
            let name = loginTextField.text,
            let password = passwordTextField.text,
            loginTrue(name: name, password: password)
            else { return }
        
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    @IBAction func logOut(segue: UIStoryboardSegue){
        loginTextField.text = nil
        passwordTextField.text = nil
        guard segue.identifier == "logOut" else { return }
    }
    
    @IBAction func registrationTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "registerTapped", sender: nil)
    }
    
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
        guard
            let name = loginTextField.text
            else { return }
        forgotPassword(name: name)
    }
}

// MARK: Forgot password
extension LoginViewController {
    private func forgotPassword(name: String){
        if name.isEmpty{
            showAlert(title: "Try again",
                      message: "The field name is empty. Please fill in the field",
                      type: .fail, user: nil)
        } else if users[name] == nil{
            showAlert(title: "Try again",
                      message: "User data is missing, enter a new value or go through registration",
                      type: .fail, user: nil)
        } else if users[name] != nil{
            showAlert(title: "Forgot password",
                      message: "Enter a new password",
                      type: .success, user: name)
        }
    }
}

// MARK: Alert controllers
extension LoginViewController {
    enum typeAlert {
        case success
        case fail
    }
    
    private func showAlert(title: String, message: String, type: typeAlert, user: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        switch type {
        case .success:
            alert.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "New password"
            }
            
            let saveAction = UIAlertAction(title: "Save", style: .default, handler: { action in
                if let newPassword = alert.textFields?.first?.text {
                    users.updateValue(newPassword, forKey: user!)
                }
            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

            alert.addAction(saveAction)
            alert.addAction(cancelAction)

        case .fail:
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
        }
        
        present(alert, animated: true)
    }
}

// MARK: Navigation
extension LoginViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let mainViewController = tabBarController.viewControllers?.first as? MainViewController else { return }
        mainViewController.login = loginTextField.text
    }
}

// MARK: User data verification
extension LoginViewController {
    
    private func loginTrue(name: String, password: String) -> Bool{
        if users.contains(where: { (arg0) -> Bool in
                let (key, value) = arg0
                return key == name && value == password
        }){
            return true
        } else {
            showAlert (title: "Try again",
                       message: "Please verify all information you have entered.",
                       type: .fail, user: nil)
        }
        return false
    }
}



// MARK: Hide keyboard
extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

// MARK: Keyboard methods
extension LoginViewController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
            guard
                let name = loginTextField.text,
                let password = passwordTextField.text,
                loginTrue(name: name, password: password)
                else { return false }
            performSegue(withIdentifier: "loginSegue", sender: nil)
        }
        return true
    }
}

