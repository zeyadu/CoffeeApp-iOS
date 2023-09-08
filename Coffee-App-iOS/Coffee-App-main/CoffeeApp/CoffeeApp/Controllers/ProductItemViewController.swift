//
//  ProductItemViewController.swift
//  CoffeeApp
//
//  Created by Fady on 13/08/2022.
//

import UIKit

class ProductItemViewController: UIViewController {
    
    var itemCounter = 1
    
    // Adding outlets for the data that needs to be displayed on the cart scene
    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var drinkPrice: UILabel!
    
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var itemCount: UILabel!
    
    var cupSize = ""
    var sugarAmount = "No Sugar"
    
    //---------------------------
    
    @IBAction func decrementButton(_ sender: Any) {
        if itemCounter > 1 {
            itemCounter-=1
            itemCount.text = "\(itemCounter)"
            calcPrice()
        }
    }
    
    @IBAction func incrementButton(_ sender: Any) {
        itemCounter+=1
        itemCount.text = "\(itemCounter)"
        calcPrice()
    }
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var addCartOutlet: UIButton!
    @IBOutlet weak var priceField: UILabel!
    @IBOutlet weak var minusOutlet: UIButton!
    @IBOutlet weak var plusOutlet: UIButton!
    @IBOutlet weak var sugarSmall: UIImageView!
    @IBOutlet weak var sugarMedium1: UIImageView!
    @IBOutlet weak var sugarMedium2: UIImageView!
    @IBOutlet weak var sugarLarge1: UIImageView!
    @IBOutlet weak var sugarLarge2: UIImageView!
    @IBOutlet weak var sugarLarge3: UIImageView!
    
    @IBAction func onClickAddToCart(_ sender: UIButton) {
        CartViewController.cartList.append(CartItem(title: drinkName.text!, image: drinkImage.image!, price: Int(priceField
                                                                                                                    .text!)!, sugar: sugarAmount, size: cupSize, count: Int(itemCount.text!)!))
        print("cupSize: \(cupSize)...sugarAmount:\(sugarAmount)")
        print("Cart List count: \(CartViewController.cartList.count)")
    }
    
    
    
    @IBAction func largeSize(_ sender: UIButton) {
        sender.setBackgroundImage(UIImage(named: "macciato"), for: .normal)
        button1.setBackgroundImage(UIImage(named: "not selected"), for: .normal)
        button2.setBackgroundImage(UIImage(named: "not selected"), for: .normal)
        
        cupSize = "L"
        drinkPrice.text = "50"
        calcPrice()
    }
    @IBAction func mediumSize(_ sender: UIButton) {
        sender.setBackgroundImage(UIImage(named: "macciato"), for: .normal)
        button1.setBackgroundImage(UIImage(named: "not selected"), for: .normal)
        button3.setBackgroundImage(UIImage(named: "not selected"), for: .normal)
        
        cupSize = "M"
        drinkPrice.text = "40"
        calcPrice()
    }
    @IBAction func smallSize(_ sender: UIButton) {
        sender.setBackgroundImage(UIImage(named: "macciato"), for: .normal)
        button2.setBackgroundImage(UIImage(named: "not selected"), for: .normal)
        button3.setBackgroundImage(UIImage(named: "not selected"), for: .normal)
        
        cupSize = "S"
        drinkPrice.text = "30"
        calcPrice()
    }
    @IBAction func sugar1(_ sender: Any) {
        sugarSmall.image=UIImage(systemName: "cube.fill")
        sugarMedium1.image=UIImage(systemName: "cube")
        sugarMedium2.image=UIImage(systemName: "cube")
        sugarLarge1.image=UIImage(systemName: "cube")
        sugarLarge2.image=UIImage(systemName: "cube")
        sugarLarge3.image=UIImage(systemName: "cube")
        
        sugarAmount = "1"
    }
    @IBAction func sugar2(_ sender: Any) {
        sugarSmall.image=UIImage(systemName: "cube")
        sugarMedium1.image=UIImage(systemName: "cube.fill")
        sugarMedium2.image=UIImage(systemName: "cube.fill")
        sugarLarge1.image=UIImage(systemName: "cube")
        sugarLarge2.image=UIImage(systemName: "cube")
        sugarLarge3.image=UIImage(systemName: "cube")
        sugarAmount = "2"
    }
    @IBAction func sugar3(_ sender: Any) {
        sugarSmall.image=UIImage(systemName: "cube")
        sugarMedium1.image=UIImage(systemName: "cube")
        sugarMedium2.image=UIImage(systemName: "cube")
        sugarLarge1.image=UIImage(systemName: "cube.fill")
        sugarLarge2.image=UIImage(systemName: "cube.fill")
        sugarLarge3.image=UIImage(systemName: "cube.fill")
        sugarAmount = "3"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        displayData()
        
    }
    
    // Function to display corresponding drink data
    func displayData() {
        drinkName.text = CategoryViewController.currentDrinkName
        drinkImage.image = CategoryViewController.currentDrinkImage
        
    }
    
    // Function to calculate corresponding total price
    func calcPrice() {
        var selectedPrice = Int(drinkPrice.text!)!
        priceField.text = "\(selectedPrice * itemCounter)"
    }
    
    func setUpUI(){
        //This function is used to make rounded corners in different ui components
        addCartOutlet.clipsToBounds=true
        addCartOutlet.layer.cornerRadius=addCartOutlet.frame.height/2
        
//        plusOutlet.clipsToBounds=true
//        plusOutlet.layer.cornerRadius = plusOutlet.frame.height/2
//        plusOutlet.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
//
//        minusOutlet.clipsToBounds=true
//        minusOutlet.layer.cornerRadius = minusOutlet.frame.height/2
//        minusOutlet.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
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
