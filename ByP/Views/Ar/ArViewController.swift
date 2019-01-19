//
//  ArViewController.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 13..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture
import Action
import ARKit

final class ArViewController: UIViewController {
    var viewModel: ArViewModel!
    let bag = DisposeBag()
    var isPaintingAdded = false
    private var paintingNodeIndex = 0
    private var paintingPositionInScene = SCNVector3()
    private var paintingInitialRotation = SCNVector3()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var myView: ArView! { return self.view as? ArView }

    override func loadView() {
        super.loadView()
        let customView = ArView()
        view = customView
        dismissKeyboard()
        bindViewModel()
        addTapGestureRecogniser()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.isIdleTimerDisabled = true
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        myView.sceneView.session.run(configuration, options: [.removeExistingAnchors, .resetTracking])
        myView.sceneView.delegate = self
        myView.sceneView.session.delegate = self
        viewModel.arState.accept(.noPlain)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func bindViewModel() {
        loadViewIfNeeded()
        myView.editButton.rx.tap
            .withLatestFrom(viewModel.isControlsHidden)
            .map { !$0 }
            .bind(to: viewModel.isControlsHidden)
            .disposed(by: bag)

        viewModel.isControlsHidden
            .withLatestFrom(viewModel.arState) { ($0, $1) }
            .subscribe(onNext: { [weak self] isControlsHidden, arState in
                if let self = self {
                    if arState == ArStates.set {
                        self.myView.controls.isHidden = true
                        self.myView.opacitySlider.isHidden = false
                        self.myView.opacityLabel.isHidden = false
                        self.myView.editButton.isHidden = true
                        self.myView.setButton.isHidden = true
                    } else {
                        self.myView.controls.isHidden = isControlsHidden
                        self.myView.opacitySlider.isHidden = isControlsHidden
                        self.myView.opacityLabel.isHidden = isControlsHidden
                    }
                }
            })
            .disposed(by: bag)

        myView.exitButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                if let self = self {
                    self.dismiss(animated: true, completion: nil)
                }
            })
            .disposed(by: bag)

        myView.xSlider.rx.value
            .subscribe(onNext: { value in
                self.myView.xLabel.text = "X tengely: \(String(format: "%.2f", value)) m"
            })
            .disposed(by: bag)

        myView.ySlider.rx.value
            .subscribe(onNext: { value in
                self.myView.yLabel.text = "Y tengely: \(String(format: "%.2f", value)) m"
            })
            .disposed(by: bag)

        myView.zSlider.rx.value
            .subscribe(onNext: { value in
                self.myView.zLabel.text = "Z tengely: \(String(format: "%.2f", value)) m"
            })
            .disposed(by: bag)

        myView.rotationSlider.rx.value
            .subscribe(onNext: { value in
                self.myView.rotationLabel.text = "Forgatás: \(String(format: "%.2f", value))º"
            })
            .disposed(by: bag)

        myView.scaleSlider.rx.value
            .subscribe(onNext: { value in
                self.myView.scaleLabel.text = "Nagyítás: \(String(format: "%.2f", value))x"
            })
            .disposed(by: bag)

        myView.opacitySlider.rx.value
            .subscribe(onNext: { value in
                self.myView.opacityLabel.text = "Áttetszőség: \(String(format: "%.1f", value*100))%"
            })
            .disposed(by: bag)
        viewModel.arState
            .subscribe(onNext: { [weak self] state in
                if let self = self {
                    switch state {
                    case .noPlain:
                        self.myView.instructionLabel.isHidden = false
                        self.myView.instructionLabel.text = "Mozgasd a telefont, amíg síkot talál"
                        self.myView.setButton.isHidden = true
                        self.myView.editButton.isHidden = true
                    case .plainFound:
                        DispatchQueue.main.async {
                            self.myView.instructionLabel.isHidden = false
                            self.myView.instructionLabel.text = "Kattints a síkra a festmény elhelyezéséhez"
                            self.myView.setButton.isHidden = true
                            self.myView.editButton.isHidden = true
                        }
                    case .paintingPlaced:
                        self.myView.instructionLabel.isHidden = true
                        self.myView.setButton.isHidden = false
                        self.myView.editButton.isHidden = false
                    case .set:
                        self.myView.instructionLabel.isHidden = true
                        self.myView.setButton.isHidden = true
                        self.myView.editButton.isHidden = true
                    }
                }
            })
            .disposed(by: bag)

        myView.setButton.rx.tap
            .withLatestFrom(viewModel.arState)
            .filter { $0 == ArStates.paintingPlaced }
            .subscribe(onNext: { [weak self] _ in
                if let self = self {
                    self.myView.setButtonPressed()
                    self.viewModel.arState.accept(.set)
                    self.viewModel.isControlsHidden.accept(true)
                    self.myView.setButton.isHidden = true
                    self.myView.setNeedsLayout()
                }
            })
            .disposed(by: bag)
    }

    func calculateDimensions(withWidth: Double, photo: UIImage) -> (CGFloat, CGFloat) {
        let ratio = (photo.size.width / photo.size.height)
        return (width: CGFloat(withWidth), height: CGFloat(withWidth)/ratio)
    }

    func createPainting(from image: UIImage) -> SCNNode {
        let paintingMaterial = SCNMaterial()
        logger("Image orientation: \(image.imageOrientation.rawValue)", event: .debug)
        paintingMaterial.diffuse.contents = image
        paintingMaterial.locksAmbientWithDiffuse = true

        let backgroundMaterial = SCNMaterial()
        backgroundMaterial.diffuse.contents = UIImage(named: "painting_back")
        backgroundMaterial.locksAmbientWithDiffuse = true

        let edgeMaterial = SCNMaterial()
        edgeMaterial.diffuse.contents = UIImage(named: "painting_back")
        backgroundMaterial.locksAmbientWithDiffuse = true

        let painting = SCNBox(width: calculateDimensions(withWidth: 0.5, photo: image).0,
                              height: calculateDimensions(withWidth: 0.5, photo: image).1,
                              length: 0.01,
                              chamferRadius: 0)
        painting.firstMaterial?.diffuse.contents = UIColor.white

        let paintingNode = SCNNode(geometry: painting)
        paintingNode.renderingOrder = 200
        paintingNode.geometry?.materials = [paintingMaterial, edgeMaterial, backgroundMaterial, edgeMaterial, edgeMaterial, edgeMaterial]
        paintingNode.pivot = SCNMatrix4MakeTranslation(0.0, Float(painting.height / -2.0), 0.0)

        return paintingNode
    }

    func createPainting() -> SCNNode {
        let paintingMaterial = SCNMaterial()
        paintingMaterial.diffuse.contents = viewModel.painting
        paintingMaterial.locksAmbientWithDiffuse = true

        let backgroundMaterial = SCNMaterial()
        backgroundMaterial.diffuse.contents = #imageLiteral(resourceName: "painting_back")
        backgroundMaterial.locksAmbientWithDiffuse = true

        let edgeMaterial = SCNMaterial()
        edgeMaterial.diffuse.contents = #imageLiteral(resourceName: "edge_material")
        backgroundMaterial.locksAmbientWithDiffuse = true

        let painting = SCNBox(width: calculateDimensions(withWidth: 0.5, photo: viewModel.painting).0,
                              height: calculateDimensions(withWidth: 0.5, photo: viewModel.painting).1,
                              length: 0.01,
                              chamferRadius: 0)
        painting.firstMaterial?.diffuse.contents = UIColor.white

        let paintingNode = SCNNode(geometry: painting)
        paintingNode.renderingOrder = 200
        paintingNode.geometry?.materials = [paintingMaterial, edgeMaterial, backgroundMaterial, edgeMaterial, edgeMaterial, edgeMaterial]
        paintingNode.pivot = SCNMatrix4MakeTranslation(0.0, Float(painting.height / -2.0), 0.0)

        return paintingNode
    }

    @objc func addPaintingToScene(withGestureRecognizer recognizer: UIGestureRecognizer) {
        let tapLocation = recognizer.location(in: myView.sceneView)
        let hitTestResults = myView.sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)

        guard let hitTestResult = hitTestResults.first else {
            logger("Finding plane failed.", event: .error)
            return
        }

        let translation = hitTestResult.worldTransform.translation
        let x = translation.x
        let y = translation.y
        let z = translation.z

        let paintingNode = createPainting(from: viewModel.painting)

        myView.xSlider.value = 0.0
        myView.zSlider.value = 0.0
        paintingNode.position = SCNVector3(x, y, z)
        paintingPositionInScene = paintingNode.position
        paintingNode.eulerAngles.y = (myView.sceneView.pointOfView?.eulerAngles.y)!
        paintingInitialRotation = paintingNode.eulerAngles

        if isPaintingAdded {
        myView.sceneView.scene.rootNode.replaceChildNode(myView.sceneView.scene.rootNode.childNodes[paintingNodeIndex], with: paintingNode)
        } else {
            myView.sceneView.scene.rootNode.addChildNode(paintingNode)
            paintingNodeIndex = myView.sceneView.scene.rootNode.childNodes.count-1
            isPaintingAdded = true
        }
        viewModel.arState.accept(.paintingPlaced)
    }

    func addTapGestureRecogniser() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ArViewController.addPaintingToScene(withGestureRecognizer:)))
        myView.sceneView.addGestureRecognizer(tapRecognizer)
    }

    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

extension ArViewController: ARSCNViewDelegate, ARSessionDelegate {
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        if isPaintingAdded {
            let node = myView.sceneView.scene.rootNode.childNodes[paintingNodeIndex]
            node.position.x = paintingPositionInScene.x + myView.xSlider.value
            node.position.y = paintingPositionInScene.y + myView.ySlider.value
            node.position.z = paintingPositionInScene.z + myView.zSlider.value
            node.eulerAngles.y = paintingInitialRotation.y + myView.rotationSlider.value.degreesToRadians
            node.scale = SCNVector3(x: myView.scaleSlider.value, y: myView.scaleSlider.value, z: 1.0)
            node.opacity = CGFloat(myView.opacitySlider.value)
        }
    }

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {

        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        logger("plane found", event: .info)
        viewModel.arState.accept(.plainFound)

        let width = CGFloat(planeAnchor.extent.x)
        let height = CGFloat(planeAnchor.extent.z)
        let plane = SCNPlane(width: width, height: height)

        plane.materials.first?.diffuse.contents = UIColor.transparentBlack(alpha: 0.6)

        let planeNode = SCNNode(geometry: plane)

        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
        planeNode.position = SCNVector3(x, y, z)
        planeNode.eulerAngles.x = -.pi / 2

        node.addChildNode(planeNode)
    }

    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {

        guard let planeAnchor = anchor as?  ARPlaneAnchor,
            let planeNode = node.childNodes.first,
            let plane = planeNode.geometry as? SCNPlane
            else { return }

        let width = CGFloat(planeAnchor.extent.x)
        let height = CGFloat(planeAnchor.extent.z)
        plane.width = width
        plane.height = height

        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
        planeNode.position = SCNVector3(x, y, z)
    }

}

