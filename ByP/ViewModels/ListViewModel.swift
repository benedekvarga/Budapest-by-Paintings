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

struct ListViewModel {
    let view: ListViewController
    private let bag = DisposeBag()

    init(_ view: ListViewController) {
        self.view = view
    }
}
