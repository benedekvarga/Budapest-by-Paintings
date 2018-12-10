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
}
