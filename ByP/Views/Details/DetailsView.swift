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
    let scrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.contentSize = CGSize(width: Screen.size.width, height: 2000)
    }
    let contentView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
    }
    let numberLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.textColor = .bypBlue
        $0.text = "01"
        $0.font = UIFont.robotoRegular(ofSize: 97)
        $0.adjustsFontSizeToFitWidth = false
        $0.backgroundColor = .clear
        $0.layer.zPosition = 3
    }
    let fullSizeContainer = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
    }
    let fullSizeLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.textColor = .bypBlue
        $0.text = "Full size".uppercased()
        $0.font = UIFont.robotoMedium(ofSize: 28)
        $0.adjustsFontSizeToFitWidth = false
        $0.backgroundColor = .clear
    }
    let fullSizeIcon = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "up_triangle")
        $0.backgroundColor = .clear
    }
    let painterNameLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.textColor = .black
        $0.font = UIFont.robotoMedium(ofSize: 18)
        $0.adjustsFontSizeToFitWidth = true
    }
    let yearLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.textColor = .black
        $0.font = UIFont.robotoMedium(ofSize: 18)
        $0.adjustsFontSizeToFitWidth = true
    }
    let paintingImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    let seeInMotionContainer = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
    }
    let seeInMotionLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.textColor = .bypBlue
        $0.text = "See in motion".uppercased()
        $0.font = UIFont.robotoMedium(ofSize: 28)
        $0.adjustsFontSizeToFitWidth = false
        $0.backgroundColor = .clear
    }
    let seeInMotionIcon = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "list-triangle")
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .clear
    }
    let textView = UITextView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.font = UIFont.robotoRegular(ofSize: 13)
        $0.textColor = .black
        $0.textAlignment = .left
    }

	// MARK: - Lifecycle
	override init(frame: CGRect) {
		super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
	}

    private func setupLayout() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(fullSizeContainer)
        fullSizeContainer.addSubview(fullSizeLabel)
        fullSizeContainer.addSubview(fullSizeIcon)
        contentView.addSubview(paintingImageView)
        contentView.addSubview(numberLabel)
        contentView.addSubview(seeInMotionContainer)
        seeInMotionContainer.addSubview(seeInMotionLabel)
        seeInMotionContainer.addSubview(seeInMotionIcon)
        contentView.addSubview(painterNameLabel)
        contentView.addSubview(yearLabel)
        contentView.addSubview(textView)
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 1160)
        ])
        NSLayoutConstraint.activate([
            fullSizeContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            fullSizeContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -56),
            fullSizeContainer.heightAnchor.constraint(equalToConstant: 34),
            fullSizeContainer.widthAnchor.constraint(equalToConstant: 160)
        ])
        NSLayoutConstraint.activate([
            fullSizeLabel.leadingAnchor.constraint(equalTo: fullSizeContainer.leadingAnchor),
            fullSizeLabel.topAnchor.constraint(equalTo: fullSizeContainer.topAnchor),
            fullSizeLabel.bottomAnchor.constraint(equalTo: fullSizeContainer.bottomAnchor),
            fullSizeLabel.widthAnchor.constraint(equalToConstant: 130)
        ])
        NSLayoutConstraint.activate([
            fullSizeIcon.heightAnchor.constraint(equalToConstant: 26),
            fullSizeIcon.widthAnchor.constraint(equalToConstant: 26),
            fullSizeIcon.centerYAnchor.constraint(equalTo: fullSizeContainer.centerYAnchor),
            fullSizeIcon.trailingAnchor.constraint(equalTo: fullSizeContainer.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            paintingImageView.topAnchor.constraint(equalTo: fullSizeContainer.bottomAnchor, constant: 10),
            paintingImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            paintingImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            paintingImageView.heightAnchor.constraint(equalToConstant: 820)
        ])
        NSLayoutConstraint.activate([
            numberLabel.widthAnchor.constraint(equalToConstant: 112),
            numberLabel.heightAnchor.constraint(equalToConstant: 112),
            numberLabel.leadingAnchor.constraint(equalTo: paintingImageView.leadingAnchor, constant: 20),
            numberLabel.centerYAnchor.constraint(equalTo: paintingImageView.topAnchor)
        ])
        NSLayoutConstraint.activate([
            seeInMotionContainer.heightAnchor.constraint(equalToConstant: 34),
            seeInMotionContainer.widthAnchor.constraint(equalToConstant: 230),
            seeInMotionContainer.leadingAnchor.constraint(equalTo: paintingImageView.leadingAnchor, constant: 20),
            seeInMotionContainer.topAnchor.constraint(equalTo: paintingImageView.bottomAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            seeInMotionLabel.heightAnchor.constraint(equalTo: seeInMotionContainer.heightAnchor),
            seeInMotionLabel.leadingAnchor.constraint(equalTo: seeInMotionContainer.leadingAnchor),
            seeInMotionLabel.centerYAnchor.constraint(equalTo: seeInMotionContainer.centerYAnchor),
            seeInMotionLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        NSLayoutConstraint.activate([
            seeInMotionIcon.heightAnchor.constraint(equalToConstant: 26),
            seeInMotionIcon.widthAnchor.constraint(equalToConstant: 26),
            seeInMotionIcon.centerYAnchor.constraint(equalTo: seeInMotionContainer.centerYAnchor),
            seeInMotionIcon.trailingAnchor.constraint(equalTo: seeInMotionContainer.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            painterNameLabel.leadingAnchor.constraint(equalTo: paintingImageView.leadingAnchor, constant: 20),
            painterNameLabel.topAnchor.constraint(equalTo: seeInMotionContainer.bottomAnchor, constant: 10),
            painterNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            painterNameLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        NSLayoutConstraint.activate([
            yearLabel.leadingAnchor.constraint(equalTo: paintingImageView.leadingAnchor, constant: 20),
            yearLabel.topAnchor.constraint(equalTo: painterNameLabel.bottomAnchor, constant: 10),
            yearLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            yearLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: paintingImageView.leadingAnchor, constant: 60),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            textView.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 10)
        ])
    }

	// MARK: - Setup methods
	required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
