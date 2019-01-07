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

        myView.tableView.rx.modelSelected(Place.self)
            .map { place -> (UINavigationController, Place) in
                return (self.navigationController ?? UINavigationController(), place)
            }
            .subscribe(viewModel.seeDetailsAction.inputs)
            .disposed(by: bag)
    }

    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

extension ListViewController: UITableViewDataSource {
    // DataSource beállítása
    func setupDelegate() {
        // Should be called in ViewDidLoad()
        myView.tableView.dataSource = self
    }

    // Lista sorainak száma
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.places.value.count
    }

    // Cellák feltöltése
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListElementTableViewCell.reuseIdentifier,for: indexPath)
            as? ListElementTableViewCell else { return .init() }
        if indexPath.row < viewModel.places.value.count {
            let place = viewModel.places.value[indexPath.row]
            cell.configure(title: place.name, image: place.painting)
            return cell
        } else {
            return .init()
        }
    }

    // Kattintás lekezelése
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < viewModel.places.value.count {
            let place = viewModel.places.value[indexPath.row]
            viewModel.seeDetailsAction.execute((self.navigationController ?? UINavigationController(), place))
        }
    }
}

