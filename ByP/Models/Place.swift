//
//  Place.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 09..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import Foundation
import RealmSwift
import CoreLocation

final class Place: Object {
    // Realm objects
    @objc dynamic var name = ""
    @objc dynamic var painter = ""
    @objc dynamic var datePainted = ""
    @objc dynamic var directoryNumber = ""
    @objc dynamic var infoText = ""
    @objc dynamic var created = Date()
    @objc dynamic var saved = false
    @objc dynamic var imageString = ""
    @objc dynamic var orderId = 0
    @objc dynamic var isActive = false

    @objc dynamic var bearing = 0.0
    @objc dynamic var positionY: Float = 0.0
    @objc dynamic var longitude = 0.0
    @objc dynamic var latitude = 0.0

    @objc dynamic var width: Float = 1
    @objc dynamic var height: Float = 1
    @objc dynamic var depth: Float = 1

    // MARK: - Computed properties
    var coordinates: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    var photo: UIImage {
        return UIImage(named: imageString + "_photo") ?? UIImage()
    }
    var painting: UIImage {
        return UIImage(named: imageString + "_painting") ?? UIImage()
    }

    convenience init(name: String, imageString: String, directoryNumber: String) {
        self.init()
        self.name = name
        self.imageString = imageString
        self.directoryNumber = directoryNumber
        self.created = Date()
    }

    override static func primaryKey() -> String? {
        return "name"
    }
}
