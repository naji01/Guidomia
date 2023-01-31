//
//  Car.swift
//  Guidomia
//
//  Created by Lotfi on 31/1/2023.
//

import Foundation

class Car: Codable {
    var make: String?
    var model: String?
    var customerPrice: Double?
    var marketPrice: Double?
    var rating: Int = 0
    var consList: [String?]?
    var prosList: [String?]?
}
