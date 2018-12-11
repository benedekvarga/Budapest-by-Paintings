//
//  FullScreenImageViewModel.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 11..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import Foundation
import Foundation
import RxSwift
import RxCocoa
import Action

struct FullScreenImageViewModel {
    let view: FullScreenImageViewController
    let painting: BehaviorRelay<UIImage>
    let photo: BehaviorRelay<UIImage>
    let photoOpacity: BehaviorRelay<CGFloat>
	private let bag = DisposeBag()

    init(photo: UIImage, painting: UIImage, view: FullScreenImageViewController) {
		self.view = view
        self.painting = BehaviorRelay(value: painting)
        self.photo = BehaviorRelay(value: photo)
        self.photoOpacity = BehaviorRelay(value: 0)
	}

    var backAction: CocoaAction {
        return CocoaAction { _ in
            self.view.dismiss(animated: true, completion: nil)
            return .just(())
        }
    }
}
