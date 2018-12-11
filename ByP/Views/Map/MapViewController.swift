//
//  MapViewController.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 03..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit
import MapKit
import RxSwift
import RxCocoa

final class MapViewController: UIViewController {
    var viewModel: MapViewModel!
    let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var myView: MapView! {
        return self.view as? MapView
    }

    override func loadView() {
        super.loadView()
        let customView = MapView()
        view = customView
        myView.backgroundColor = .white
        dismissKeyboard()
        bindViewModel()
        setuMap()
    }

    func bindViewModel() {
        loadViewIfNeeded()
        // Center map
        viewModel.annotations
            .subscribe(onNext: { [weak self] places in
                if let self = self {
                    logger(places.count)
                    self.myView.mapView.addAnnotations(places)
                    logger(self.myView.mapView.annotations.count)
                    self.myView.mapView.setRegion(self.viewModel.centerMapOnLocation(location: self.myView.mapView.annotations.middle()), animated: true)
                }
            })
            .disposed(by: bag)
    }

    private func setuMap() {
        myView.mapView.delegate = self
        checkLocationAuthorizationStatus()
    }

    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

extension MapViewController: MKMapViewDelegate {
    private func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            myView.mapView.showsUserLocation = true
        } else {
            viewModel.locationManager.requestWhenInUseAuthorization()
        }
    }
}
