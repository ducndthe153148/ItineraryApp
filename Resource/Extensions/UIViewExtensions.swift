//
//  UIViewExtensions.swift
//  ItineraryApp
//
//  Created by Nguyễn Đình Trung Đức on 20/12/2021.
//

import UIKit

extension UIView {

    func addShadowAndRoundedCorner () {
        layer.shadowOpacity = 1 // visible cardview
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
    }

}
