//
//  CoffeeListModel.swift
//  CoffeeApp
//
//  Created by Fady on 16/08/2022.
//

import Foundation
import UIKit

class Coffee{
    var title: String
    var image: UIImage
    
    init(title: String, image: UIImage){
        self.title = title
        self.image = image
    }
    init()
    {
        image = UIImage(named: "")!
        title = ""
    }
}
