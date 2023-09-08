//
//  CoffeeTableViewCell.swift
//  CoffeeApp
//
//  Created by Fady on 13/08/2022.
//

import UIKit

protocol CoffeeTableViewCellDelegate: AnyObject {
    func didTapButton(drinkName: String, drinkImage: UIImage)
}

class CoffeeTableViewCell: UITableViewCell {
    
    weak var delegate: CoffeeTableViewCellDelegate?

    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkImage: UIImageView!
    
    
    @IBAction func onClickDetailsButton(_ sender: Any) {
        delegate?.didTapButton(drinkName: drinkName.text!, drinkImage: drinkImage.image!)
        
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
