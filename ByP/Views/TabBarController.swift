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
        let listViewController = ListViewController().then {
            $0.tabBarItem = UITabBarItem(title: "Helyek", image: UIImage(named: "ListIcon")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "ListIconSelected")?.withRenderingMode(.alwaysOriginal))
        }
        let mapViewController = MapViewController().then {
            $0.tabBarItem = UITabBarItem(title: "Térkép", image: UIImage(named: "MapIcon")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "MapIconSelected")?.withRenderingMode(.alwaysOriginal))
        }
        let galleryViewController = GalleryViewController().then {
            $0.tabBarItem = UITabBarItem(title: "Galéria", image: UIImage(named: "GalleryIcon")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "GalleryIconSelected")?.withRenderingMode(.alwaysOriginal))
        }
        let tabBarList = [listViewController, mapViewController, galleryViewController]
        viewControllers = tabBarList
    }
}
