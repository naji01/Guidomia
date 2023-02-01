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
        self.navigationBar.tintColor        = .white
        self.navigationBar.barTintColor     = .white
        self.navigationBar.isTranslucent    = true
        self.navigationBar.backgroundColor = color
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = color
        self.navigationBar.compactAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.standardAppearance = appearance
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
