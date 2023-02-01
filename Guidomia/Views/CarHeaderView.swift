//
//  CarHeaderView.swift
//  Guidomia
//
//  Created by Lotfi on 1/2/2023.
//

import UIKit

protocol CarHeaderViewProtocol {
    func getMakes() -> [String]
    func getModels() -> [String]
}

class CarHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = String(describing: CarHeaderView.self)
    @IBOutlet weak var filtersContentView: UIView!
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    let makePickerView = UIPickerView()
    let modelPickerView = UIPickerView()
    var model: HeaderModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func setUpView() {
        self.filtersContentView.layer.cornerRadius = 5
        makePickerView.delegate = self
        makePickerView.dataSource = self
        self.makeTextField.inputView = makePickerView
        modelPickerView.delegate = self
        modelPickerView.dataSource = self
        self.modelTextField.inputView = modelPickerView
    }
    
    func fill(model: HeaderModel?) {
        self.model = model
        self.descriptionLabel.text = model?.descriptionHeader
        self.titleLabel.text = model?.title
        if let image = model?.imageName {
            self.carImageView.image = UIImage(named: image)
        }
    }
}

extension CarHeaderView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return (pickerView == makePickerView ? model?.makesArray?.count : model?.modelsArray?.count) ?? 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerView == makePickerView ? model?.makesArray?[row] : model?.modelsArray?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == makePickerView, let make = model?.makesArray?[row] {
            makeTextField.text = make
            model?.selectMake?(make)
        } else if let model = model?.modelsArray?[row] {
            modelTextField.text = model
            self.model?.selectModel?(model)
        }
    }
}
