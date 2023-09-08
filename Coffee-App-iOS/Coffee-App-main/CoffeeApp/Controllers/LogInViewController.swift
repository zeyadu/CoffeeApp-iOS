//
//  LogInViewController.swift
//  CoffeeApp
//
//  Created by Fady on 12/08/2022.
//

import UIKit
import CoreData

class LogInViewController: UIViewController {
    static var userEmail:String?
    
    //This is just for styling purposes
    @IBOutlet weak var logInOutlet: UIButton!
    //this button takes you to the create signUp Screen
    var iconClick = true
    @IBAction func revealPassword(_ sender: Any) {
        if(iconClick == true){
            logPassField.isSecureTextEntry=false
        }else{
            logPassField.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    @IBAction func registerButton(_ sender: Any) {
        performSegue(withIdentifier: "toSignUp", sender: self)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
        logInOutlet.clipsToBounds=true
        logInOutlet.layer.cornerRadius=logInOutlet.frame.height/2

    }
    @objc func handleTap()
    {
        //This function to let user dismiss the soft keyboard
        logEmailField.resignFirstResponder()
        logPassField.resignFirstResponder()
    }
    
    //These are used to get user data
    @IBOutlet weak var logEmailField: UITextField!
    @IBOutlet weak var logPassField: UITextField!
    
    public func getUserID()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do
        {
            let predict = NSPredicate(format: "username = %@", "Test")
            let req: NSFetchRequest<User> = User.fetchRequest()
            req.predicate = predict
            let users = try context.fetch(req)
            for user in users
            {
                print(user.id)
            }
        } catch
        {
            print("An error has occured")
        }
    }
    
    public func getAllPasswords()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do
        {
            let users = try context.fetch(User.fetchRequest())
            for user in users
            {
                print((user as AnyObject).password!)
            }
        } catch
        {
            print("An error has occured")
        }
    }
    
    public func getUserPassword()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do
        {
            let predict = NSPredicate(format: "username = %@", "Test")
            let req: NSFetchRequest<User> = User.fetchRequest()
            req.predicate = predict
            let users = try context.fetch(req)
            for user in users
            {
                print(user.password!)
            }
        } catch
        {
            print("An error has occured")
        }
    }
    
    func loadProducts()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newProduct1 = Product(context: context)
        let newProduct2 = Product(context: context)
        let newProduct3 = Product(context: context)
        let newProduct4 = Product(context: context)
        let newProduct5 = Product(context: context)
        newProduct1.productname = "Espresso"
        newProduct1.image = "espresso2"
        newProduct2.productname = "Cappuccino"
        newProduct2.image = "cappuccino"
        newProduct3.productname = "Macciato"
        newProduct3.image = "latte-macchiato"
        newProduct4.productname = "Latte"
        newProduct4.image = "latte"
        newProduct5.productname = "Mocha"
        newProduct5.image = "mocha (1)"
        do
        {
            try context.save()
            print("done")
        }
        catch
        {
            let alert = UIAlertController(title: "Error", message: "Registration error has occured", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func signIn()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var allUsers = [User]()
            do {
                allUsers = try context.fetch(User.fetchRequest())
                for all in allUsers{
                    if(all.password == logPassField.text && all.email == logEmailField.text)
                    {
                        loadProducts()
                        LogInViewController.userEmail=logEmailField.text
                        self.performSegue(withIdentifier: "toCategoryScreen", sender: self)
                    }else{
                        //If the user is not found you trigger an alert
                        let alert = UIAlertController(title: "Error", message: "User not found", preferredStyle: .alert)
                        let cancelAction = UIAlertAction(title: "Ok", style: .cancel)
                        alert.addAction(cancelAction)
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            } catch {
                print("an error has occured while logging in")
            }
    }
    
    @IBAction func logInButton(_ sender: Any) {
        
        //function to take you to category screen after validating the user
        //Uncomment next line and then delete self.perfrom segue
        signIn()

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
