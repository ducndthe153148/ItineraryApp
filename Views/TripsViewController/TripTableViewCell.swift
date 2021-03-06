//
//  TripTableViewCell.swift
//  ItineraryApp
//
//  Created by Nguyễn Đình Trung Đức on 20/12/2021.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // happen first when cell created
        
        cardView.addShadowAndRoundedCorner()
        tripImage.layer.cornerRadius = cardView.layer.cornerRadius
        
    }

    func setUp (tripModel: TripModel) {
        titleLabel.text = tripModel.title
        
        if let tripImages = tripModel.image {
            tripImage.alpha = 0.3
            tripImage.image = tripImages
            UIView.animate(withDuration: 1) {
                self.tripImage.alpha = 1
            }
        }
    }
}
