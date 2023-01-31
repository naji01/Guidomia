//
//  GuidomiaNavigationController.swift
//  Guidomia
//
//  Created by Lotfi on 30/1/2023.
//

import UIKit

class GuidomiaNavigationController: UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.navigationBar.tintColor        = UIColor.orange
        self.navigationBar.barTintColor     = UIColor.orange
        self.navigationBar.isTranslucent    = false
        self.navigationBar.backgroundColor = UIColor.orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
