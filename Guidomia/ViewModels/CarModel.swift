//
//  CarModel.swift
//  Guidomia
//
//  Created by Lotfi on 31/1/2023.
//

import Foundation

struct CarModel {
    
    var model: String? = ""
    var price: String? = ""
    var imageName: String? = ""
    var rating: Int = 0
    
    
    static func getModel(_ car: Car) -> CarModel {
        
        var carModel = CarModel()
        
        carModel.model = car.model
        if let price = car.marketPrice {
            carModel.price = "Price: \(String(describing: price/1000))k"
        }
        carModel.imageName = car.model
        carModel.rating = car.rating
        
        return carModel
    }
}
