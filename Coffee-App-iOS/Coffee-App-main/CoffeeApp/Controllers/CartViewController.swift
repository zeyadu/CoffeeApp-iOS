//
//  CartViewController.swift
//  CoffeeApp
//
//  Created by Fady on 16/08/2022.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var myTable: UITableView!
    
    var subTotalVar = 0
    @IBOutlet weak var subTotal: UILabel!
    static var cartList: [CartItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Testing")
        initialsizeSubTotal()

        // Do any additional setup after loading the view.
    }
    
    static func clearTable()
    {
        cartList = []
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartViewController.cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cartCell") as! CartTableViewCell
        
        cell.coffeeImage.image = CartViewController.cartList[indexPath.row].image
        cell.coffeeName.text = CartViewController.cartList[indexPath.row].title
        cell.coffeePrice.text = String(CartViewController.cartList[indexPath.row].price)
        cell.coffeeAmount.text = String(CartViewController.cartList[indexPath.row].count)
        cell.coffeeSize.text = CartViewController.cartList[indexPath.row].size
        cell.sugarAmount.text = CartViewController.cartList[indexPath.row].sugar
        cell.minusButton.tag = indexPath.row
        cell.plusButton.tag = indexPath.row
        cell.minusButton.addTarget(self, action: #selector(onClickMinus), for: .touchUpInside)
        cell.plusButton.addTarget(self, action: #selector(onClickPlus), for: .touchUpInside)
        
        return cell
    }
    
    @objc func onClickMinus(sender: UIButton){
        let indexpath1 = IndexPath(row: sender.tag, section: 0)
        let selectedItemCount = Int(CartViewController.cartList[indexpath1.row].count)
        
        if selectedItemCount > 1 {
            CartViewController.cartList[indexpath1.row].count = selectedItemCount - 1
            CartViewController.cartList[indexpath1.row].price = CartViewController.cartList[indexpath1.row].price - CartViewController.cartList[indexpath1.row].price/selectedItemCount
            subTotalVar -= CartViewController.cartList[indexpath1.row].price/(selectedItemCount-1)
            
            print("\(subTotalVar)")
            self.loadView()
            subTotal.text = "\(subTotalVar)"
           // subTotal.reloadInputViews()
            print("-")
        }
    }
    
    @objc func onClickPlus(sender: UIButton){
        let indexpath1 = IndexPath(row: sender.tag, section: 0)
        let selectedItemCount = Int(CartViewController.cartList[indexpath1.row].count)
        
        CartViewController.cartList[indexpath1.row].count = selectedItemCount + 1
        CartViewController.cartList[indexpath1.row].price = CartViewController.cartList[indexpath1.row].price + CartViewController.cartList[indexpath1.row].price/selectedItemCount
        subTotalVar += CartViewController.cartList[indexpath1.row].price/(selectedItemCount+1)
        
        
        print("\(subTotalVar)")
        self.loadView()
        subTotal.text = "\(subTotalVar)"
        print("+")
    }
    
    func initialsizeSubTotal(){
        for cartItem in CartViewController.cartList{
            subTotalVar += cartItem.price
        }
        print("\(subTotalVar)")
        subTotal.text = "\(subTotalVar)"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 201.0
    }
    
    
}

