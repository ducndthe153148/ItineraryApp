//
//  TripModel.swift
//  ItineraryApp
//
//  Created by Nguyễn Đình Trung Đức on 20/12/2021.
//

import Foundation

class TripModel {
    var id: String!
    var title: String!
    
    init(title: String){
        id = UUID().uuidString
        self.title = title
    }
}
