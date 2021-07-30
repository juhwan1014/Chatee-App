//
//  RegisterViewController.swift
//  ChateeInClass
//
//  Created by APPLE on 2021-01-26.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
   
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text
        
        else{return}
        
        Auth.auth().createUser(withEmail: email, password: password){(user, error) in
            if let err = error{
                print("Error creating firebase user: \(err)")
            }else{
                print("Successfully created user \(String(describing: user))")
                self.performSegue(withIdentifier: "showChatView", sender: self)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
