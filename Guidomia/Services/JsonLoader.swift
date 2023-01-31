//
//  JsonLoader.swift
//  Guidomia
//
//  Created by Lotfi on 31/1/2023.
//

import Foundation

class JsonLoader {
    
    func load(fileName: String, then: @escaping (Result<Data, Error>) -> Void) {
        guard let bundlePath = Bundle.main.path(forResource: fileName, ofType: "json") else {
            then(.failure(GuidomiaError.fileNotFound))
            return
        }
        if let jsonData = try? String(contentsOfFile: bundlePath).data(using: .utf8) {
            then(.success(jsonData))
        } else {
            then(.failure(GuidomiaError.dataInvalid))
        }
    }
}
