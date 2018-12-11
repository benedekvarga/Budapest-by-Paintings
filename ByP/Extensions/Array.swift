//
//  Array.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 10..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import Foundation
import MapKit

extension Array where Element: MKAnnotation {
    public func middle() -> CLLocationCoordinate2D {
        if isEmpty {
            return CLLocationCoordinate2D(latitude: 0, longitude: 0)
        }

        var top: CLLocationCoordinate2D = (first?.coordinate)!
        var bottom: CLLocationCoordinate2D = (first?.coordinate)!
        var left: CLLocationCoordinate2D = (first?.coordinate)!
        var right: CLLocationCoordinate2D = (first?.coordinate)!

        for coordinate in map({$0.coordinate}) {
            if coordinate.longitude > top.longitude {
                top = coordinate
            }
            if coordinate.longitude < bottom.longitude {
                bottom = coordinate
            }
            if coordinate.latitude > left.latitude {
                left = coordinate
            }
            if coordinate.latitude < right.latitude {
                right = coordinate
            }
        }
        return CLLocationCoordinate2D(latitude: Double(left.latitude + right.latitude) / 2, longitude: Double(top.longitude + bottom.longitude) / 2)
    }
}
