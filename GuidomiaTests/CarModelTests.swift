//
//  CarModelTests.swift
//  GuidomiaTests
//
//  Created by Lotfi on 1/2/2023.
//

import Foundation

import XCTest
@testable import Guidomia

final class CarModelTests: XCTestCase {
    
    
    func testCarModel() {
        
        let model = CarModel.getModel(mockCar())
        
        XCTAssertEqual(model.model, "3300i")
        XCTAssertEqual(model.price, "Price: 55.9k")
        XCTAssertEqual(model.rating, 5)
        XCTAssertNotNil(model.consAttr)
        XCTAssertNotNil(model.prosAttr)
        XCTAssertNotNil(model.consTitle)
        XCTAssertNotNil(model.prosTitle)
    }
    
    func mockCar() -> Car {
        let car = Car()
        car.model = "3300i"
        car.marketPrice = 55900.0
        car.customerPrice = 65000.0
        car.rating = 5
        car.prosList = [
            "Your average business man car",
            "Can bring the family home safely",
            "The city must have"
          ]
        car.consList = [
            "You can heard the engine over children cry at the back",
            "",
            "You may lose this one if you divorce"
          ]
        return car
    }
}
