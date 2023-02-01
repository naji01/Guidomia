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
        models.first?.isExpanded = true
        carsViewModel = models
    }
    func selectCar(index: Int) {
        
        for i in 0 ..< carsViewModel.count {
            
            let carModel = carsViewModel[i]
            carModel.isExpanded = index == i ? !carModel.isExpanded : false
        }
        self.updateCarsList?()
    }
}
