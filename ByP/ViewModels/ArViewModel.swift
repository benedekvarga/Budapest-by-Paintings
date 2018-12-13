//
//  ArViewModel.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 13..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action
import RxRealm
import RealmSwift

import Foundation
import RxSwift
import RxCocoa

struct ArViewModel {
    let view: ArViewController
    let place: BehaviorRelay<Place>
    private let bag = DisposeBag()

    init(_ view: ArViewController, place: Place) {
        self.view = view
        self.place = BehaviorRelay<Place>(value: place)
    }
}
