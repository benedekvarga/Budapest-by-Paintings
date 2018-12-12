//
//  DetailsView.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 11..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit
import Then

final class DetailsView: UIView {
	// MARK: - UI Elements
    let painterNameLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 24)
        $0.adjustsFontSizeToFitWidth = true
    }
    let yearLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.adjustsFontSizeToFitWidth = true
    }
    private let separatorView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
    }
    let paintingImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    var animationButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.setTitle("See in motion", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.setTitleColor(.gray, for: .highlighted)
    }

	// MARK: - Lifecycle
	override init(frame: CGRect) {
		super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
	}

    private func setupLayout() {
        addSubview(painterNameLabel)
        addSubview(yearLabel)
        addSubview(separatorView)
        addSubview(paintingImageView)
        addSubview(animationButton)
        let guide = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            painterNameLabel.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1),
            painterNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            painterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            painterNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            yearLabel.topAnchor.constraint(equalTo: painterNameLabel.bottomAnchor, constant: 10),
            yearLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            yearLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            yearLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 5)
        ])
        NSLayoutConstraint.activate([
            animationButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            animationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            animationButton.heightAnchor.constraint(equalToConstant: 48),
            animationButton.bottomAnchor.constraint(equalToSystemSpacingBelow: guide.bottomAnchor, multiplier: 1)
        ])
        NSLayoutConstraint.activate([
            paintingImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            paintingImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            paintingImageView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 18),
            paintingImageView.bottomAnchor.constraint(equalTo: animationButton.topAnchor, constant: -10)
        ])
    }

	// MARK: - Setup methods
	required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
