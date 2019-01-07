//
//  ListElementTableViewCell.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 09..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit
import Then

final class ListElementTableViewCell: UITableViewCell {
    let triangleIcon = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .clear
        $0.tintColor = .bypBlue
        $0.image = UIImage(named: "list-triangle")
    }

    let titleLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.textColor = .black
        $0.adjustsFontSizeToFitWidth = true
        $0.font = UIFont.robotoMedium(ofSize: 18)
    }

    let painterLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.textColor = .black
        $0.adjustsFontSizeToFitWidth = true
        $0.font = UIFont.robotoLightItalic(ofSize: 18)
    }

    let numberTitle = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .right
        $0.textColor = .bypBlue
        $0.font = UIFont.robotoRegular(ofSize: 48)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    private func setupLayout() {
        backgroundColor = .white
        contentView.addSubview(triangleIcon)
        NSLayoutConstraint.activate([
            triangleIcon.heightAnchor.constraint(equalToConstant: 26),
            triangleIcon.widthAnchor.constraint(equalToConstant: 26),
            triangleIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            triangleIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18)
        ])
        contentView.addSubview(numberTitle)
        NSLayoutConstraint.activate([
            numberTitle.heightAnchor.constraint(equalToConstant: 56),
            numberTitle.widthAnchor.constraint(equalToConstant: 56),
            numberTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            numberTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: triangleIcon.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: numberTitle.leadingAnchor, constant: -18),
            titleLabel.centerYAnchor.constraint(equalTo: triangleIcon.topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        contentView.addSubview(painterLabel)
        NSLayoutConstraint.activate([
            painterLabel.leadingAnchor.constraint(equalTo: triangleIcon.trailingAnchor, constant: 16),
            painterLabel.trailingAnchor.constraint(equalTo: numberTitle.leadingAnchor, constant: -18),
            painterLabel.centerYAnchor.constraint(equalTo: triangleIcon.bottomAnchor),
            painterLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }

    func configure(title: String, painter: String, number: Int) {
        self.titleLabel.text = title
        self.painterLabel.text = painter
        self.numberTitle.text = number < 9 ? "0\(number+1)" : "\(number+1)"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
