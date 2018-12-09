//
//  MapViewController.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 03..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit

final class MapViewController: UIViewController {
    var viewModel: MapViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var myView: MapView! {
        return self.view as? MapView
    }

    override func loadView() {
        super.loadView()
        let customView = MapView()
        view = customView
        myView.backgroundColor = .white
        dismissKeyboard()
        bindViewModel()
    }

    func bindViewModel() {
        loadViewIfNeeded()
        myView.backgroundColor = .red
    }

    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
