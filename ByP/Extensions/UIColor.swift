//
//  UIColor.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 03..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit

extension UIColor {

    // Initializers
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }

    /// Initializes and returns a color object using the specified opacity and HEX value.
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(red: (hex & 0xFF0000) >> 16, green: (hex & 0x00FF00) >> 8, blue: hex & 0x0000FF, alpha: alpha)
    }

    static func gray(_ color: Int) -> UIColor {
        return .init(red: color, green: color, blue: color)
    }

    static func transparentBlack(alpha: CGFloat) -> UIColor {
        return black.withAlphaComponent(alpha)
    }

    static func transparentWhite(alpha: CGFloat) -> UIColor {
        return white.withAlphaComponent(alpha)
    }

    // Custom colors
    static var bypBlue: UIColor { return .init(hex: 0x0000FF) }

}
