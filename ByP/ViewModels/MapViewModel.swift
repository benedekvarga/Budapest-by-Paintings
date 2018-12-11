//
//  MapViewModel.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 09..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import MapKit
import RxRealm
import RealmSwift

struct MapViewModel {
    let view: MapViewController
    private let bag = DisposeBag()
    private let regionRadius: CLLocationDistance = 1000
    let locationManager = CLLocationManager()
    let places = BehaviorRelay<[Place]>(value: [])
    let annotations = BehaviorRelay<[CustomMapAnnotation]>(value: [])

    init(_ view: MapViewController) {
        self.view = view
        subscribeLocationChanges()
    }

    private func subscribeLocationChanges() {
        do {
            let realm = try Realm()
            let locationsResult = realm.objects(Place.self)
            Observable.collection(from: locationsResult)
                .map { $0.toArray() }
                .bind(to: self.places)
                .disposed(by: bag)
        } catch {
            logger("Realm init error.")
        }

        places
            .map { $0.map { CustomMapAnnotation($0) } }
            .bind(to: annotations)
            .disposed(by: bag)
    }

    func centerMapOnLocation(location: CLLocationCoordinate2D) -> MKCoordinateRegion {
        return MKCoordinateRegion(center: location, latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
    }
}
