//
//  GalleryViewController.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 03..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    var viewModel: GalleryViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var myView: GalleryView! {
        return self.view as? GalleryView
    }

    override func loadView() {
        super.loadView()
        let customView = GalleryView()
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
