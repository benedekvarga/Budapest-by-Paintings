//
//  ListViewModel.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 09..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxRealm
import RealmSwift
import Action
import UIKit

struct ListViewModel {
    let view: ListViewController
    private let bag = DisposeBag()
    let places = BehaviorRelay<[Place]>(value: [])

    init(_ view: ListViewController) {
        self.view = view
        subscribePlaces()
    }

    private func subscribePlaces() {
        do {
            let realm = try Realm()
            let placesResults = realm.objects(Place.self).sorted(byKeyPath: "orderId")
            Observable.collection(from: placesResults)
                .map { $0.toArray() }
                .bind(to: places)
                .disposed(by: bag)
        } catch {
            logger("Realm init failed.")
        }
    }

    private(set) lazy var seeDetailsAction: Action<(UINavigationController, Place), Void> = { `self` in
        Action { controller, place in
            let vc = DetailsViewController()
            let viewModel = DetailsViewModel(place: place, vc)
            vc.viewModel = viewModel
            controller.pushViewController(vc, animated: true)
            return .just(())
        }
    }(self)
}
