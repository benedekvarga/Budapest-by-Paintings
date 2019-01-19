//
//  ArView.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 13..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit
import ARKit

final class ArView: UIView {
	// MARK: - UI Elements
    let sceneView = ARSCNView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.autoenablesDefaultLighting = true
        $0.automaticallyUpdatesLighting = true
        $0.antialiasingMode = .multisampling4X
    }
    let exitButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .bypBlue
        $0.setTitle("Exit", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.setTitleColor(.transparentWhite(alpha: 0.6), for: .highlighted)
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
    }
    let editButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .bypBlue
        $0.setTitle("Edit", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.setTitleColor(.transparentWhite(alpha: 0.6), for: .highlighted)
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
    }
    let controls = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .transparentWhite(alpha: 0.15)
    }
    let opacityLabel = UILabel().then {
        $0.setupSliderLabel()
        $0.text = "Áttetszőség"
    }
    let opacitySlider = UISlider().then {
        $0.setupSlider()
        $0.minimumValue = 0
        $0.maximumValue = 1
        $0.value = 1
    }
    let scaleLabel = UILabel().then {
        $0.setupSliderLabel()
        $0.text = "Nagyítás"
    }
    let scaleSlider = UISlider().then {
        $0.setupSlider()
        $0.value = 1
        $0.minimumValue = 1
        $0.maximumValue = 30
    }
    let rotationLabel = UILabel().then {
        $0.setupSliderLabel()
        $0.text = "Forgatás"
    }
    let rotationSlider = UISlider().then {
        $0.setupSlider()
        $0.value = 0
        $0.minimumValue = 0
        $0.maximumValue = 360
    }
    let xLabel = UILabel().then {
        $0.setupSliderLabel()
        $0.text = "X tengely"
    }
    let xSlider = UISlider().then {
        $0.setupSlider()
        $0.value = 0
        $0.minimumValue = -30
        $0.maximumValue = 30
    }
    let yLabel = UILabel().then {
        $0.setupSliderLabel()
        $0.text = "Y tengely"
    }
    let ySlider = UISlider().then {
        $0.setupSlider()
        $0.value = 0
        $0.minimumValue = 0
        $0.maximumValue = 30
    }
    let zLabel = UILabel().then {
        $0.setupSliderLabel()
        $0.text = "Z tengely"
    }
    let zSlider = UISlider().then {
        $0.setupSlider()
        $0.value = 0
        $0.minimumValue = -30
        $0.maximumValue = 30
    }

	// MARK: - Lifecycle
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubViews()
        setupConstraints()
	}

	// MARK: - Setup methods
    private func addSubViews() {
        addSubview(sceneView)
        addSubview(editButton)
        addSubview(exitButton)
        addSubview(controls)
        controls.addSubview(opacityLabel)
        controls.addSubview(opacitySlider)
        controls.addSubview(scaleLabel)
        controls.addSubview(scaleSlider)
        controls.addSubview(rotationLabel)
        controls.addSubview(rotationSlider)
        controls.addSubview(xLabel)
        controls.addSubview(xSlider)
        controls.addSubview(yLabel)
        controls.addSubview(ySlider)
        controls.addSubview(zLabel)
        controls.addSubview(zSlider)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            sceneView.topAnchor.constraint(equalTo: topAnchor),
            sceneView.bottomAnchor.constraint(equalTo: bottomAnchor),
            sceneView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sceneView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            editButton.heightAnchor.constraint(equalToConstant: 50),
            editButton.widthAnchor.constraint(equalToConstant: 60),
            editButton.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            editButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            exitButton.heightAnchor.constraint(equalToConstant: 50),
            exitButton.widthAnchor.constraint(equalToConstant: 60),
            exitButton.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            exitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            controls.leadingAnchor.constraint(equalTo: leadingAnchor),
            controls.trailingAnchor.constraint(equalTo: trailingAnchor),
            controls.bottomAnchor.constraint(equalTo: bottomAnchor),
            controls.heightAnchor.constraint(equalToConstant: 400)
        ])
        NSLayoutConstraint.activate([
            opacityLabel.leadingAnchor.constraint(equalTo: controls.leadingAnchor, constant: 12),
            opacityLabel.trailingAnchor.constraint(equalTo: controls.trailingAnchor, constant: -12),
            opacityLabel.topAnchor.constraint(equalTo: controls.topAnchor, constant: 10),
            opacityLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            opacitySlider.leadingAnchor.constraint(equalTo: controls.leadingAnchor, constant: 12),
            opacitySlider.trailingAnchor.constraint(equalTo: controls.trailingAnchor, constant: -12),
            opacitySlider.topAnchor.constraint(equalTo: opacityLabel.bottomAnchor),
            opacitySlider.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            scaleLabel.leadingAnchor.constraint(equalTo: controls.leadingAnchor, constant: 12),
            scaleLabel.trailingAnchor.constraint(equalTo: controls.trailingAnchor, constant: -12),
            scaleLabel.topAnchor.constraint(equalTo: opacitySlider.bottomAnchor),
            scaleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            scaleSlider.leadingAnchor.constraint(equalTo: controls.leadingAnchor, constant: 12),
            scaleSlider.trailingAnchor.constraint(equalTo: controls.trailingAnchor, constant: -12),
            scaleSlider.topAnchor.constraint(equalTo: scaleLabel.bottomAnchor),
            scaleSlider.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            rotationLabel.leadingAnchor.constraint(equalTo: controls.leadingAnchor, constant: 12),
            rotationLabel.trailingAnchor.constraint(equalTo: controls.trailingAnchor, constant: -12),
            rotationLabel.topAnchor.constraint(equalTo: scaleSlider.bottomAnchor),
            rotationLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            rotationSlider.leadingAnchor.constraint(equalTo: controls.leadingAnchor, constant: 12),
            rotationSlider.trailingAnchor.constraint(equalTo: controls.trailingAnchor, constant: -12),
            rotationSlider.topAnchor.constraint(equalTo: rotationLabel.bottomAnchor),
            rotationSlider.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            xLabel.leadingAnchor.constraint(equalTo: controls.leadingAnchor, constant: 12),
            xLabel.trailingAnchor.constraint(equalTo: controls.trailingAnchor, constant: -12),
            xLabel.topAnchor.constraint(equalTo: rotationSlider.bottomAnchor),
            xLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            xSlider.leadingAnchor.constraint(equalTo: controls.leadingAnchor, constant: 12),
            xSlider.trailingAnchor.constraint(equalTo: controls.trailingAnchor, constant: -12),
            xSlider.topAnchor.constraint(equalTo: xLabel.bottomAnchor),
            xSlider.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            yLabel.leadingAnchor.constraint(equalTo: controls.leadingAnchor, constant: 12),
            yLabel.trailingAnchor.constraint(equalTo: controls.trailingAnchor, constant: -12),
            yLabel.topAnchor.constraint(equalTo: xSlider.bottomAnchor),
            yLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            ySlider.leadingAnchor.constraint(equalTo: controls.leadingAnchor, constant: 12),
            ySlider.trailingAnchor.constraint(equalTo: controls.trailingAnchor, constant: -12),
            ySlider.topAnchor.constraint(equalTo: yLabel.bottomAnchor),
            ySlider.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            zLabel.leadingAnchor.constraint(equalTo: controls.leadingAnchor, constant: 12),
            zLabel.trailingAnchor.constraint(equalTo: controls.trailingAnchor, constant: -12),
            zLabel.topAnchor.constraint(equalTo: ySlider.bottomAnchor),
            zLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            zSlider.leadingAnchor.constraint(equalTo: controls.leadingAnchor, constant: 12),
            zSlider.trailingAnchor.constraint(equalTo: controls.trailingAnchor, constant: -12),
            zSlider.topAnchor.constraint(equalTo: zLabel.bottomAnchor),
            zSlider.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

	required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

private extension UILabel {
    func setupSliderLabel() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .left
        self.backgroundColor = .clear
        self.font = UIFont.systemFont(ofSize: 16, weight: .light)
    }
}

private extension UISlider {
    func setupSlider() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.tintColor = .black
    }
}
