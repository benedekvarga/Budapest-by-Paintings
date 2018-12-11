//
//  DetailsViewModel.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 11..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action
import RxRealm
import RealmSwift

struct DetailsViewModel {
	let view: DetailsViewController
	private let bag = DisposeBag()

    init(_ view: DetailsViewController) {
        self.view = view
    }
}
