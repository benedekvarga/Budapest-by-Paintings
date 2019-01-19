//
//  FloatingPoint.swift
//  ByP
//
//  Created by Benedek Varga on 2019. 01. 19..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import Foundation

extension FloatingPoint {
    var degreesToRadians: Self {
        return self * .pi / 180
    }
    var radiansToDegrees: Self {
        return self * 180 / .pi
    }
}
