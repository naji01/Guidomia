//
//  CarsDecoder.swift
//  Guidomia
//
//  Created by Lotfi on 31/1/2023.
//

import Foundation

class GuidomiaDecoder {
    
    func decode<T: Codable>(_ data: Data) throws -> [T] {
        guard let list = try? JSONDecoder().decode([T].self, from: data) else {
            throw GuidomiaError.dataInvalid
        }
        return list
    }
}
