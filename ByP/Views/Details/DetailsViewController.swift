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
        myView.setNeedsLayout()
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

        myView.layoutIfNeeded()
    }

    private func setupNavigationBar() {
        if let navBar = self.navigationController?.navigationBar {
            navBar.titleTextAttributes = [.foregroundColor: UIColor.bypBlue, .font: UIFont.robotoMedium(ofSize: 22)]
            navBar.tintColor = .bypBlue
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
        viewModel.place
            .map { $0.infoText }
            .bind(to: myView.textView.rx.text)
            .disposed(by: bag)
        viewModel.place
            .map { place in
                let id = place.orderId + 1
                return id < 10 ? "0\(id)" : "\(id)"
            }
            .bind(to: myView.numberLabel.rx.text)
            .disposed(by: bag)
        // Play video
        let motionTap = UITapGestureRecognizer()
        myView.seeInMotionContainer.isUserInteractionEnabled = true
        myView.seeInMotionContainer.addGestureRecognizer(motionTap)
        motionTap.rx.event
            .subscribe(onNext: { [weak self] _ in
                self?.viewModel.playVideoAction.execute(())
            })
            .disposed(by: bag)
        // Fullscreen image
        let imageTap = UITapGestureRecognizer()
        myView.fullSizeContainer.isUserInteractionEnabled = true
        myView.fullSizeContainer.addGestureRecognizer(imageTap)
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
