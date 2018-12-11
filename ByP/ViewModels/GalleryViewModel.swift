//
//  GalleryViewModel.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 09..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct GalleryViewModel {
    let view: GalleryViewController
//    let place: Place
    private let bag = DisposeBag()

    init(_ view: GalleryViewController) {
        self.view = view
//        self.place = place
    }
}
