//
//  CarCellView.swift
//  Guidomia
//
//  Created by Lotfi on 31/1/2023.
//

import UIKit

class CarCellView: UITableViewCell {
    
    static let identifier = String(describing: CarCellView.self)
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingStackView: UIStackView!
    @IBOutlet weak var expandableView: UIView!
    @IBOutlet weak var prosLabel: UILabel!
    @IBOutlet weak var consLabel: UILabel!
    @IBOutlet weak var prosListLabel: UILabel!
    @IBOutlet weak var consListLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(carModel: CarModel?) {
        
        guard let carModel = carModel else {return}
        self.modelLabel.text = carModel.model
        self.priceLabel.text = carModel.price
        if let image = carModel.imageName {
            self.carImageView.image = UIImage(named: image)
        }
        self.addStartView(rating: carModel.rating)
       
        if carModel.isExpanded == true {
            
            self.prosLabel.text = carModel.prosTitle
            self.consLabel.text = carModel.consTitle
            self.prosListLabel.attributedText = carModel.prosAttr
            self.consListLabel.attributedText = carModel.consAttr
        } else {
            self.prosLabel.text = ""
            self.consLabel.text = ""
            self.prosListLabel.text = ""
            self.consListLabel.text = ""
        }
    }
    
    func addStartView(rating: Int?) {
        self.ratingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        guard var count = rating else {return}
        
        let startImage = UIImage(named: "star")
        while count != 0 {
            let startImageView = UIImageView(image: startImage)
            startImageView.widthAnchor.constraint(equalTo: startImageView.heightAnchor, multiplier: 1).isActive = true
            startImageView.contentMode = .scaleAspectFit
            self.ratingStackView.addArrangedSubview(startImageView)
            count -= 1
        }
    }
}
