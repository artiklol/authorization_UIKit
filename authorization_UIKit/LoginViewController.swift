//
//  LoginViewController.swift
//  authorization_UIKit
//
//  Created by Artem Sulzhenko on 21.10.2022.
//

import UIKit

struct User{
    let name: String
    let password: String
}

private let userLiza = User(name: "Liza", password: "malinaliz")

class LoginViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var hintNameButton: UIButton!
    @IBOutlet var hintPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setItemsSettings()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "profilSegue" else { return }
        let welcomeVC = segue.destination as! ProfilViewController
        welcomeVC.userName = nameTextField.text
    }
    // MARK: - IBActions
    @IBAction func logInButtonPressed() {
        guard
            nameTextField.text == userLiza.name,
            passwordTextField.text == userLiza.password
        else {
            passwordTextField.text = nil
            displayAlert(withTitle: "Error",
                         message: "Login or password entered incorrectly")
            return
        }
        
        performSegue(withIdentifier: "profilSegue", sender: nil)
        
    }
    
    @IBAction func forgotButtonsPressed(_ sender: UIButton) {
        switch sender.tag{
        case 1:
            displayAlert(withTitle: "Oops!",
                         message: "Your name is \(userLiza.name) 😉")
        case 2:
            displayAlert(withTitle: "Oops!",
                         message: "Your password is \(userLiza.password) 😉")
        default:
            break
        }
    }
    
    @IBAction func unwindSegie(_ sender: UIStoryboardSegue) {
        nameTextField.text = nil
        passwordTextField.text = nil
    }
}

extension LoginViewController{
    // MARK: - Set items settings
    private func setItemsSettings(){
        view.backgroundColor = UIColor(red: 232/255,
                                       green: 82/255,
                                       blue: 122/255,
                                       alpha: 1)
        
        nameTextField.placeholder = "Enter the user name..."
        nameTextField.clearButtonMode = .whileEditing
        nameTextField.delegate = self
        
        passwordTextField.placeholder = "Enter the password..."
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.backgroundColor = .purple
        logInButton.layer.cornerRadius = 15
        
        hintNameButton.setTitle("Forgot User Name?", for: .normal)
        hintNameButton.setTitleColor(.white, for: .normal)
        
        hintPasswordButton.setTitle("Forgot Password?", for: .normal)
        hintPasswordButton.setTitleColor(.white, for: .normal)
    }
    
    // MARK: - Alert Controller
    private func displayAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}

// MARK: - Text Field Delegate
extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
            passwordTextField.resignFirstResponder()
        }
        return true
    }
}
