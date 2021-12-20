//
//  FloatingActionButton.swift
//  ItineraryApp
//
//  Created by Nguyễn Đình Trung Đức on 20/12/2021.
//

import UIKit

class FloatingActionButton: UIButton {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        tintColor = UIColor.white
        layer.backgroundColor = Theme.tint?.cgColor
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25 // shadow behind button
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
        
    }
    

}
