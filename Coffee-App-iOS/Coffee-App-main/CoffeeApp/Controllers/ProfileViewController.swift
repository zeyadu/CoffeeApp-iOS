//
//  ProfileViewController.swift
//  CoffeeApp
//
//  Created by Fady on 12/08/2022.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileView: UIImageView!
    
    @IBOutlet weak var emailField: UILabel!
    @IBOutlet weak var nameField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //styling profile pic
        profileView.clipsToBounds=true
        profileView.layer.cornerRadius=profileView.frame.height/2
        
        //styling logout button
        logOutOutlet.clipsToBounds=true
        logOutOutlet.layer.cornerRadius=logOutOutlet.frame.height/2
    }
    override func viewDidAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var allUsers = [User]()
        do{
            allUsers = try context.fetch(User.fetchRequest())
            for user in allUsers {
                if user.email==LogInViewController.userEmail{
                    self.emailField.text=user.email
                    self.nameField.text=user.username
                    welcomeOutlet.text="Hi \(user.username!)"
                }
            }
        }catch{}
    }
    //Field to print user first name
    @IBOutlet weak var welcomeOutlet: UILabel!
    @IBOutlet weak var logOutOutlet: UIButton!
    
    @IBAction func logOutButton(_ sender: Any) {
        CartViewController.clearTable()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var allProds = [Product]()
            do {
                allProds = try context.fetch(Product.fetchRequest())
                for prods in allProds{
                    context.delete(prods)
                }
            } catch {
                print("an error has occured while logging out")
            }
        self.performSegue(withIdentifier: "toLogInScreen", sender: self)
        
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
