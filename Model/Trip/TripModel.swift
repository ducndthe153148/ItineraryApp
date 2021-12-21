//
//  TripModel.swift
//  ItineraryApp
//
//  Created by Nguyễn Đình Trung Đức on 20/12/2021.
//

import Foundation
import UIKit

class TripModel {
    let id: UUID
    var title: String!
    var image: UIImage?
    
    init(title: String, image: UIImage? = nil){
        id = UUID()
        self.title = title
        self.image = image
    }
}
