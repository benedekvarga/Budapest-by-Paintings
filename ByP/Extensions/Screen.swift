//
//  Screen.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 11..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit

enum Screen {
    static var size: CGSize { return UIScreen.main.bounds.size }
    static var statusBarSize: CGSize { return UIApplication.shared.statusBarFrame.size }
    static var statusBar: UIView! { return UIApplication.shared.value(forKey: "statusBar") as? UIView }
}
