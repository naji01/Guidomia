//
//  CarsService.swift
//  Guidomia
//
//  Created by Lotfi on 31/1/2023.
//

import Foundation

enum GuidomiaError: Error {
    case fileNotFound
    case dataInvalid
}
protocol CarsServiceProtocol {
    func getCars(then: @escaping (Result<[Car], Error>) -> Void)
}

class CarsService: CarsServiceProtocol {
    
    func getCars(then: @escaping (Result<[Car], Error>) -> Void) {
        
        JsonLoader().load(fileName: "car_list") { result in
            
            switch result {
            case .success(let result):
                do {
                    let cars: [Car] = try GuidomiaDecoder().decode(result)
                    then(.success(cars))
                } catch (let error) {
                    then(.failure(error))
                }
            case .failure(let error):
                then(.failure(error))
            }
        }
    }
}
