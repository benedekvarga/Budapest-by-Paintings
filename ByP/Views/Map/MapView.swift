//
//  MapView.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 09..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit
import MapKit

final class MapView: UIView {
    let mapView = MKMapView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsScale = true
        $0.showsCompass = true
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
