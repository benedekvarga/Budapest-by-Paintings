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
    let place: BehaviorRelay<Place>
	private let bag = DisposeBag()

    init(place: Place, _ view: DetailsViewController) {
        self.view = view
        self.place = BehaviorRelay(value: place)
    }

    private(set) lazy var seeFullScreenImageAction: Action<(UIViewController, photo: UIImage, painting: UIImage), Void> = { `self` in
        Action { controller, photo, painting in
            let vc = FullScreenImageViewController()
            let vm = FullScreenImageViewModel(photo: photo, painting: painting, view: vc)
            vc.viewModel = vm
            controller.present(vc, animated: true)
            return .just(())
        }
    }(self)

}
