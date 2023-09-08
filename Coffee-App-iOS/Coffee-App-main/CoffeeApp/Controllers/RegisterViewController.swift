//
//  RegisterViewController.swift
//  CoffeeApp
//
//  Created by Fady on 12/08/2022.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    
    //This is just an outlet to style buttons
    @IBOutlet weak var signUpOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
        //For styling sign up button
        signUpOutlet.clipsToBounds=true
        signUpOutlet.layer.cornerRadius=signUpOutlet.frame.height/2
    }
    var iconClick = true
    @IBAction func registerRevealPass(_ sender: Any) {
        if(iconClick == true){
            passwordField.isSecureTextEntry=false
        }else{
            passwordField.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    
    @IBAction func registerRevealRepeat(_ sender: Any) {
        if(iconClick == true){
            repPasswordField.isSecureTextEntry=false
        }else{
            repPasswordField.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    
    
    @objc func handleTap()
    {
        //This function to let user dismiss the soft keyboard
        emailField.resignFirstResponder()
        nameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        repPasswordField.resignFirstResponder()
    }    //These are the otlets used to get user data
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repPasswordField: UITextField!
    
    func signUp()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newUser = User(context: context)
        if(passwordField.text != repPasswordField.text)
        {
            let alert = UIAlertController(title: "Error", message: "Passwords fields don't match", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            newUser.username=nameField.text
            newUser.email = emailField.text
            newUser.password = passwordField.text
            do
            {
                try context.save()
                let alert = UIAlertController(title: "Done", message: "User registered successfully", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .cancel)
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)            }
            catch
            {
                let alert = UIAlertController(title: "Error", message: "Registration error has occured", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .cancel)
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        signUp()
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
