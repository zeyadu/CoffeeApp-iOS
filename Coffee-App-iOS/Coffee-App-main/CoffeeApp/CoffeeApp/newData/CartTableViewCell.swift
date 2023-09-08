//
//  CartTableViewCell.swift
//  CoffeeApp
//
//  Created by Mayar Adel on 8/16/22.
//

import UIKit

protocol CartTableViewCellDelegate: AnyObject {
    func didTapPlus()
    func didTapMinus()
}

class CartTableViewCell: UITableViewCell {

    weak var delegate: CartTableViewCellDelegate?
    
    @IBOutlet weak var coffeeImage: UIImageView!
    
    @IBOutlet weak var sugarAmount: UILabel!
    @IBOutlet weak var coffeePrice: UILabel!
    @IBOutlet weak var coffeeName: UILabel!
    @IBOutlet weak var coffeeAmount: UILabel!
    
    @IBOutlet weak var coffeeSize: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBAction func onClickMinus(_ sender: UIButton) {
        delegate?.didTapMinus()
    }
    
    @IBAction func onClickPlus(_ sender: UIButton) {
        delegate?.didTapPlus()
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
