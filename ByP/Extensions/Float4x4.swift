//
//  Float4x4.swift
//  ByP
//
//  Created by Benedek Varga on 2019. 01. 19..
//  Copyright © 2019. Benedek Varga. All rights reserved.
//

import ARKit

extension float4x4 {
    var translation: float3 {
        let translation = self.columns.3
        return float3(translation.x, translation.y, translation.z)
    }
}
