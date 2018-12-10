//
//  ViewController.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 03..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class ListViewController: UIViewController {
    var viewModel: ListViewModel!
    private let bag = DisposeBag()

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
        bindTableView()
    }

    private func bindTableView() {
        viewModel.places
            .bind(to: myView.tableView.rx.items(cellIdentifier: ListElementTableViewCell.reuseIdentifier, cellType: ListElementTableViewCell.self)) { _, item, cell in
                cell.configure(title: item.name, image: item.painting)
        }
        .disposed(by: bag)
    }

    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

