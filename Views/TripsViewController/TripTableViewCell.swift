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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // happen first when cell created
        
        cardView.addShadowAndRoundedCorner()
        
        
    }

    func setUp (tripModel: TripModel) {
        titleLabel.text = tripModel.title
        
    }
}
