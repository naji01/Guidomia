//
//  HomeViewModel.swift
//  Guidomia
//
//  Created by Lotfi on 30/1/2023.
//

import Foundation

class HomeViewModel {
    
    var carsService: CarsServiceProtocol
    var carsArray: [Car] = [] {
        didSet {
            self.getCarsViewModel(cars: self.carsArray)
        }
    }
    var updateCarsList: (() -> Void)?
    var carsViewModel: [CarModel] {
        didSet {
            self.updateCarsList?()
        }
    }
    
    init(carsService: CarsServiceProtocol) {
        self.carsService = carsService
        self.carsViewModel = []
    }
    
    func getCarsRequest() {
        
        self.carsService.getCars { [weak self] result in
            switch result {
            case .success(let cars):
                self?.carsArray = cars
            case.failure(_):
                self?.carsArray = []
            }
        }
    }
    func getCarsViewModel(cars: [Car]) {
        var models: [CarModel] = []
        
        cars.forEach { car in
            models.append(CarModel.getModel(car))
        }
        carsViewModel = models
    }
}
