//
//  TripModel.swift
//  ItineraryApp
//
//  Created by Nguyễn Đình Trung Đức on 20/12/2021.
//

import Foundation

class TripModel {
    let id: UUID
    var title: String!
    
    init(title: String){
        id = UUID()
        self.title = title
    }
}
