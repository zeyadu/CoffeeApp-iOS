//
//  CategoryViewController.swift
//  CoffeeApp
//
//  Created by Fady on 13/08/2022.
//

import UIKit
import CoreData

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
     var currentDrinkName = "Default"
     var currentDrinkImage: UIImage?
    
    //var coffees = [Coffee(title: "Espresso", image: UIImage(named: "espresso2")!), Coffee(title: "Cappuccino", image: UIImage(named: "cappuccino")!), Coffee(title: "Macciato", image: UIImage(named: "latte-macchiato")!), Coffee(title: "Mocha", image: UIImage(named: "mocha (1)")!), Coffee(title: "Latte", image: UIImage(named: "latte")!)]
    
    var prods = [Coffee]()
    
    func loadingData()
    {
        var count = 0
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var everything = [Product]()
            do {
                everything = try context.fetch(Product.fetchRequest())
                for all in everything
                {
                    prods.append(Coffee(title: all.productname!, image: UIImage(named: all.image!)!))
                    count+=1
                }
                print("Data loaded in Category View Successfully!")
            } catch {
                print("An error has occured while loading data in category view controller")
            }
    }
    
    //var allProducts : [Coffee]
    //var coffees = ["Espresso","Cappuccino","Macciato","Mocha","Latte"]
    
    override func viewDidLoad() {
        loadingData()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prods.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item=prods[indexPath.row]
        let storyboard=UIStoryboard(name: "ProductItemStoryboard", bundle: nil)
        let vc=storyboard.instantiateViewController(withIdentifier: "productItemScreen") as! ProductItemViewController
        vc.image=item.image
        vc.Title=item.title
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "listCell") as! CoffeeTableViewCell
        
        cell.drinkName.text = prods[indexPath.row].title
        cell.drinkImage.image = prods[indexPath.row].image
        
        //cell.delegate = self
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}

//extension CategoryViewController: CoffeeTableViewCellDelegate {
//    func didTapButton(drinkName: String, drinkImage: UIImage) {
//        CategoryViewController.currentDrinkName = drinkName
//        CategoryViewController.currentDrinkImage = drinkImage
//
//    }
//}
