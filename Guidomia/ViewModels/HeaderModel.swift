//
//  HeaderModel.swift
//  Guidomia
//
//  Created by Lotfi on 1/2/2023.
//

import Foundation

protocol CarHeaderViewModelProtocol {
    
    var selectMake: ((String) -> Void)? { get set }
    var selectModel: ((String) -> Void)? { get set }
}
struct HeaderModel: CarHeaderViewModelProtocol {
  
    var selectModel: ((String) -> Void)?
    var selectMake: ((String) -> Void)?
    var makesArray: [String]?
    var modelsArray: [String]?
    var title: String?
    var descriptionHeader: String?
    var imageName: String?
}
