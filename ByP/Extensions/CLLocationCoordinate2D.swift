//
//  CLLocationCoordinate2D.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 10..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import Foundation
import MapKit

extension CLLocationCoordinate2D {
    static func + (_ left: CLLocationCoordinate2D, _ right: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: left.latitude + right.latitude, longitude: left.longitude + right.longitude)
    }
}
