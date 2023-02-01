//
//  GuidomiaNavigationController.swift
//  Guidomia
//
//  Created by Lotfi on 30/1/2023.
//

import UIKit

class GuidomiaNavigationController: UINavigationController {
    
    override init(rootViewController: UIViewController) {
        let color = UIColor(named: "Orange") ?? UIColor.orange
        super.init(rootViewController: rootViewController)
        self.navigationBar.tintColor        = color
        self.navigationBar.barTintColor     = color
        self.navigationBar.isTranslucent    = true
        self.navigationBar.backgroundColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
