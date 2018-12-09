//
//  ViewController.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 03..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {
    var viewModel: ListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var myView: ListView! {
        return self.view as? ListView
    }

    override func loadView() {
        super.loadView()
        let customView = ListView()
        view = customView
        myView.backgroundColor = .white
        dismissKeyboard()
        bindViewModel()
    }

    func bindViewModel() {
        loadViewIfNeeded()
        myView.backgroundColor = .blue
    }

    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

