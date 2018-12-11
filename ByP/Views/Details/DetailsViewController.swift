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
    private let bag = DisposeBag()

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
        dismissKeyboard()
        bindViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        if let navBar = self.navigationController?.navigationBar {
            navBar.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 24, weight: .thin)]
            navBar.tintColor = .black
            navBar.barTintColor = .white
        }
    }

    func bindViewModel() {
        loadViewIfNeeded()

        viewModel.place
            .map { $0.name }
            .bind(to: self.rx.title)
            .disposed(by: bag)
        viewModel.place
            .map { $0.painter }
            .bind(to: myView.painterNameLabel.rx.text)
            .disposed(by: bag)
        viewModel.place
            .map { $0.datePainted }
            .bind(to: myView.yearLabel.rx.text)
            .disposed(by: bag)
        viewModel.place
            .map { $0.painting }
            .bind(to: myView.paintingImageView.rx.image)
            .disposed(by: bag)
        let imageTap = UITapGestureRecognizer()
        myView.paintingImageView.isUserInteractionEnabled = true
        myView.paintingImageView.addGestureRecognizer(imageTap)
        imageTap.rx.event
            .withLatestFrom(Observable.combineLatest(Observable.just(self), viewModel.place))
            .map { (vc, place) -> (UIViewController, UIImage, UIImage) in
                return (vc, place.photo, place.painting)
            }
            .subscribe(viewModel.seeFullScreenImageAction.inputs)
            .disposed(by: bag)
    }

    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
