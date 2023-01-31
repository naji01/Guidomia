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
    }
    
    func addStartView(rating: Int?) {
        self.ratingStackView.removeAllArrangedSubviews()
        
        guard var count = rating else {return}
        
        let startImage = UIImage(named: "star")
        while count != 0 {
            let startImageView = UIImageView(image: startImage)
            startImageView.contentMode = .scaleAspectFit
            self.ratingStackView.addArrangedSubview(startImageView)
            count -= 1
        }
    }
}
