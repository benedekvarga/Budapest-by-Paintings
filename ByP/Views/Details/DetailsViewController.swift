//
//  DetailsViewController.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 11..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture
import Action

final class DetailsViewController: UIViewController {
    var viewModel: DetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var myView: DetailsView! {
        return self.view as? DetailsView
    }

    override func loadView() {
        super.loadView()
        let customView = DetailsView()
        view = customView
        myView.backgroundColor = .white
        dismissKeyboard()
        bindViewModel()
    }

    func bindViewModel() {
        loadViewIfNeeded()
        myView.backgroundColor = .gray
    }

    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
