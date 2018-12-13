//
//  FullScreenImageViewController.swift
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

final class FullScreenImageViewController: UIViewController {
    private let bag = DisposeBag()
	var viewModel: FullScreenImageViewModel!
	var myView: FullScreenImageView! { return self.view as? FullScreenImageView }

  	override func loadView() {
  		super.loadView()
        let customView = FullScreenImageView()
        view = customView
  		dismissKeyboard()
        bindViewModel()
  	}

  	// MARK: - Binds
  	func bindViewModel() {
        loadViewIfNeeded()
        viewModel.painting
            .bind(to: myView.paintingImageView.rx.image)
            .disposed(by: bag)
        viewModel.photo
            .bind(to: myView.photoImageView.rx.image)
            .disposed(by: bag)
        let panRecogniser = UIPanGestureRecognizer()
        self.myView.addGestureRecognizer(panRecogniser)
        panRecogniser.rx.event
            .withLatestFrom(viewModel.photoOpacity) { ($0.translation(in: self.myView).x.distance(to: 0), $1) }
            .map { distance, prevOpacity -> CGFloat in
                let maxValue = Screen.size.width * 0.7
                let value = prevOpacity - (distance / maxValue)
                if value < 0 {
                    return 0
                } else if value > 100 {
                    return 100
                }
                return value
            }
            .bind(to: viewModel.photoOpacity)
            .disposed(by: bag)
        viewModel.photoOpacity
            .map { $0 / 100.0 }
            .bind(to: myView.photoImageView.rx.alpha)
            .disposed(by: bag)
        myView.backButton.rx.action = viewModel.backAction
  	}

  	@objc
  	func dismissKeyboard() {
		self.view.endEditing(true)
	}
}
