//
//  CustomMapAnnotations.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 10..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import Foundation
import MapKit
import Action
import RxSwift
import RxCocoa

class CustomMapAnnotation: NSObject, MKAnnotation {
    let title: String?
    let image: UIImage?
    var coordinate: CLLocationCoordinate2D
    let place: Place

    init(_ interestPoint: Place) {
        self.title = interestPoint.name
        self.image = interestPoint.painting
        self.coordinate = CLLocationCoordinate2D(
            latitude: interestPoint.latitude,
            longitude: interestPoint.longitude)
        self.place = interestPoint
        super.init()
    }
}

extension MapViewController {
    // MARK: - Delegate methods
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        guard let annotation = annotation as? CustomMapAnnotation else { return nil }

        let identifier = "annotation"
        var view: MKMarkerAnnotationView

        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true

            var infoButton = UIButton(type: .detailDisclosure)
            infoButton.rx.tap
                .withLatestFrom(Observable.combineLatest(Observable.just(self), Observable.just(annotation.place)))
                .subscribe(viewModel.showArAction.inputs)
                .disposed(by: bag)

            infoButton.tintColor = UIColor.black
            view.rightCalloutAccessoryView = infoButton

            let spotImage = UIImageView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 30, height: 30)))
            spotImage.layer.borderWidth = 0
            spotImage.layer.cornerRadius = 4
            spotImage.clipsToBounds = true
            spotImage.image = annotation.image
            view.leftCalloutAccessoryView = spotImage
        }

        view.markerTintColor = .bypBlue
        view.titleVisibility = .hidden
        view.displayPriority = .required

        return view
    }
}
