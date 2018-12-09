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
    let titleLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    let backgroundImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    private func setupLayout() {
        contentView.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func configure(title: String, image: UIImage) {
        self.titleLabel.text = title
        let bwImage: UIImage = {
            let parameters = [
                kCIInputSaturationKey: 0,
                "inputContrast": NSNumber(value: 1)
            ]
            let image = CIImage(image: image)?.applyingFilter("CIColorControls", parameters: parameters)
            let context = CIContext(options: nil)
            return UIImage(cgImage: context.createCGImage(image!, from: (image?.extent)!)!)
        }()
        self.backgroundImageView.image = bwImage
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
