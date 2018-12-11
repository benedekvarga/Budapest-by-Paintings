//
//  FullScreenImageView.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 11..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit

final class FullScreenImageView: UIView {
	// MARK: - UI Elements
    let paintingImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.contentMode = .scaleAspectFit
    }
    let photoImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.contentMode = .scaleAspectFit
    }
    var backButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.bypBlue
        $0.setImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.setImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate).alpha(0.5), for: .highlighted)
        $0.tintColor = .white
    }

	// MARK: - Lifecycle
	override init(frame: CGRect) {
		super.init(frame: frame)
        backgroundColor = .black
		setupLayout()
	}

    private func setupLayout() {
        addSubview(paintingImageView)
        addSubview(photoImageView)
        addSubview(backButton)
        let guide = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            paintingImageView.topAnchor.constraint(equalTo: topAnchor),
            paintingImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            paintingImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            paintingImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 42),
            backButton.heightAnchor.constraint(equalToConstant: 42),
            backButton.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }

	// MARK: - Setup methods
	required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
