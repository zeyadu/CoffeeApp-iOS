//
//  CartListModel.swift
//  CoffeeApp
//
//  Created by Mayar Adel on 8/15/22.
//

import Foundation
import UIKit

class CartItem{
    var title: String
    var image: UIImage
    var price: Int
    var sugar: String
    var size: String
    var count: Int
    
    init(title: String, image: UIImage, price: Int, sugar: String, size: String, count: Int){
        self.title = title
        self.image = image
        self.price = price
        self.sugar = sugar
        self.size = size
        self.count = count
    }
}
