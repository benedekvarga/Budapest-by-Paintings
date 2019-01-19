//
//  Double.swift
//  ByP
//
//  Created by Benedek Varga on 2019. 01. 19..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import Foundation

extension Double {
    func metersToLatitude() -> Double {
        return self / (6373000.0)
    }

    func metersToLongitude() -> Double {
        return self / (5602900.0)
    }

    func toRadians() -> Double {
        return self * .pi / 180.0
    }

    func toDegrees() -> Double {
        return self * 180.0 / .pi
    }
}
