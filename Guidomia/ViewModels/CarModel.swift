//
//  CarModel.swift
//  Guidomia
//
//  Created by Lotfi on 31/1/2023.
//

import UIKit

class CarModel {
    
    var model: String? = ""
    var price: String? = ""
    var imageName: String? = ""
    var rating: Int = 0
    
    var prosTitle: String?
    var consTitle: String?
    var prosAttr: NSMutableAttributedString?
    var consAttr: NSMutableAttributedString?
    
    var isExpanded: Bool = false
    
    static func getModel(_ car: Car) -> CarModel {
        
        let carModel = CarModel()
        
        carModel.model = car.model
        if let price = car.marketPrice {
            carModel.price = "Price: \(String(describing: price/1000))k"
        }
        carModel.imageName = car.model
        carModel.rating = car.rating
        var elements: [String]? = []
        car.prosList?.forEach({ pros in
            if let pros = pros, pros != "" {
                elements?.append(pros)
            }
        })
        carModel.prosAttr = CarModel.getCheckList(elements: elements)
        if elements?.count ?? 0 > 0 {
            carModel.prosTitle = "Pros :"
        }

        elements = []
        car.consList?.forEach({ cons in
            if let cons = cons, cons != "" {
                elements?.append(cons)
            }
        })
        carModel.consAttr = CarModel.getCheckList(elements: elements)
     
        if elements?.count ?? 0 > 0 {
            carModel.consTitle = "Cons :"
        }
        return carModel
    }
    
    static func getCheckList(elements: [String]?) -> NSMutableAttributedString? {
        
        guard let elements = elements else {
            return nil
        }
        let attributed = NSMutableAttributedString()
        for element in elements {
            
            let attr = NSAttributedString(string: " .", attributes: [
                .font: UIFont.systemFont(ofSize: 30, weight: UIFont.Weight(rawValue: 20)),
                .foregroundColor : UIColor(named: "Orange") ?? UIColor.orange])
            let textAttr = NSAttributedString(string: " \(element)\n", attributes: [
                .font: UIFont.boldSystemFont(ofSize: 14),
                .foregroundColor : UIColor.black])
            attributed.append(attr)
            attributed.append(textAttr)
        }
        return attributed
    }
}
