//
//  ReusableView.swift
//  ByP
//
//  Created by Benedek Varga on 2018. 12. 09..
//  Copyright © 2018. Benedek Varga. All rights reserved.
//

import UIKit

// If a UIView is a ReusableView, then have a reuseIdentifier
protocol ReusableView {}
extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

// If a view loadable by a 'Nib', then have a 'nibName'
protocol NibLoadableView {}
extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

// Extend reusable views
extension UITableViewCell: ReusableView {}
extension UITableViewCell: NibLoadableView {}
extension UICollectionReusableView: ReusableView {}
extension UICollectionReusableView: NibLoadableView {}
