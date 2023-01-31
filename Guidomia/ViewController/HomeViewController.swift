//
//  HomeViewController.swift
//  Guidomia
//
//  Created by Lotfi on 30/1/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel?
    
    @IBOutlet weak var carstableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        self.viewModel?.updateCarsList = { [weak self] in
            
            self?.carstableView.reloadData()
        }
        self.viewModel?.getCarsRequest()
    }
    func setUpView() {
        
        self.carstableView.register(UINib(nibName: CarCellView.identifier, bundle: Bundle.init(for: CarCellView.self)), forCellReuseIdentifier: CarCellView.identifier)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.carsViewModel.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CarCellView.identifier, for: indexPath) as? CarCellView {
            cell.fill(carModel: self.viewModel?.carsViewModel[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
