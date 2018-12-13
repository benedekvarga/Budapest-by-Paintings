//
//  ArViewController.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 13..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture
import Action

final class ArViewController: UIViewController {
    var viewModel: ArViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var myView: ArView! { return self.view as? ArView }

    override func loadView() {
        super.loadView()
        let customView = ArView()
        view = customView
        dismissKeyboard()
        bindViewModel()
    }

    override func viewDidAppear(_ animated: Bool) {
    }

    func bindViewModel() {
        loadViewIfNeeded()

    }

    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
