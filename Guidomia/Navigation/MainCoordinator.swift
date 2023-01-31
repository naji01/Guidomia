//
//  MainCoordinator.swift
//  Guidomia
//
//  Created by Lotfi on 30/1/2023.
//

import UIKit

protocol Coordinator {
    
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navController: GuidomiaNavigationController { get set }
    
    func start()
}

class MainCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navController: GuidomiaNavigationController
    
    var window: UIWindow?

    init(window: UIWindow?, nav: GuidomiaNavigationController = GuidomiaNavigationController(rootViewController: UIViewController())) {
        self.window = window
        self.navController = nav
    }
    
    func start() {
        let vc = HomeViewController()
        self.navController = GuidomiaNavigationController(rootViewController: vc)
        let carsService = CarsService()
        vc.viewModel = HomeViewModel(carsService: carsService)

        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
