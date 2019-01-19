//
//  SCNVector3.swift
//  ByP
//
//  Created by Benedek Varga on 2019. 01. 19..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import Foundation
import SceneKit

extension SCNVector3 {

    static func - (lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3 {
        return SCNVector3(lhs.x - rhs.x,
                          lhs.y - rhs.y,
                          lhs.z - rhs.z
        )
    }

}
