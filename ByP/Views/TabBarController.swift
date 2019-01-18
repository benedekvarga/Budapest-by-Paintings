//
//  TabBarController.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 03..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit
import Then

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        tabBar.tintColor = .bypBlue
        tabBar.backgroundColor = UIColor.transparentWhite(alpha: 0.4)
        tabBar.isTranslucent = true
        // MARK: - List
        let listViewController = ListViewController().then {
            $0.tabBarItem = UITabBarItem(title: "Helyek", image: UIImage(named: "ListIcon")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "ListIconSelected")?.withRenderingMode(.alwaysOriginal))
            $0.viewModel = ListViewModel($0)
        }
        // MARK: - Map
        let mapViewController = MapViewController().then {
            $0.tabBarItem = UITabBarItem(title: "Térkép", image: UIImage(named: "MapIcon")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "MapIconSelected")?.withRenderingMode(.alwaysOriginal))
            $0.viewModel = MapViewModel($0)
        }
        
        let tabBarList = [mapViewController, listViewController]
        viewControllers = tabBarList
    }
}
