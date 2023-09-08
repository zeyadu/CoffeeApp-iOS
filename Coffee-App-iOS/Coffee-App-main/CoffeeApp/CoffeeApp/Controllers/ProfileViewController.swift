//
//  ProfileViewController.swift
//  CoffeeApp
//
//  Created by Fady on 12/08/2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //styling profile pic
        profileView.clipsToBounds=true
        profileView.layer.cornerRadius=profileView.frame.height/2
        
        //styling logout button
        logOutOutlet.clipsToBounds=true
        logOutOutlet.layer.cornerRadius=logOutOutlet.frame.height/2
        
        let userName="Testing"
        welcomeOutlet.text!="Hi \(userName) !"
        
    }
    //Field to print user first name
    @IBOutlet weak var welcomeOutlet: UILabel!
    @IBOutlet weak var logOutOutlet: UIButton!
    
    @IBAction func logOutButton(_ sender: Any) {
        let cart = CartViewController()
        cart.clearTable()
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
