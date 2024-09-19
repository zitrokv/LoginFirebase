//
//  ViewController.swift
//  LoginFirebase
//
//  Created by Mañanas on 13/9/24.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginButton(_ sender: Any) {
        let email = usernameTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().signIn(withEmail: email, password: password) { //[weak self] 
            authResult, error in
          //guard let strongSelf = self else { return }
          // ...
            if let error = error {
                print("Error al iniciar sesión")
            } else {
                print("Login correcto")
                self.goToHome()
            }
            
        }
    }
    
    func goToHome() {
            self.performSegue(withIdentifier: "goToHome", sender: self)
        }
    
    @IBAction func newUserButton(_ sender: Any) {
        let email = usernameTextField.text!
        let password = passwordTextField.text!
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
            
            if let error = error {
                print("Error al crear usuario")
            } else {
                print("Registro usuario correcto")
            }
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func navigateToHome() {
           self.performSegue(withIdentifier: "navigateToHome", sender: self)
       }
       
       func navigateToVerifyEmail() {
           self.performSegue(withIdentifier: "navigateToEmailVerification", sender: self)
       }

}

