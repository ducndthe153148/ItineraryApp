//
//  TripFunction.swift
//  ItineraryApp
//
//  Created by Nguyễn Đình Trung Đức on 20/12/2021.
//

import Foundation
import UIKit

class TripFunction {
    static func createTrip(tripModel: TripModel) {
        Data.tripModels.append(tripModel)
    }
    
    static func readTrip(completion: @escaping () -> ()){
        // DispatchQueue: Manages what work occrs on what threads
        // quality of service (qos) defines priority for thread - .userInteractive: highest priority, .background: lowest priority
        // async: your app wont wait for you code to finish. it will continue on
        
        // Giúp người dùng thấy ngay UI mà không phải chờ
        
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Trip to Bali"))
                Data.tripModels.append(TripModel(title: "Trip to Mexico"))
                Data.tripModels.append(TripModel(title: "Trip to VietNam"))
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
        
    }
    
    static func updateTrip(at index: Int, title: String, image: UIImage? = nil){
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
    }
    
    static func deleteTrip(index: Int){
        Data.tripModels.remove(at: index)
    }
}
