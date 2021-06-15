//
//  RocketListCollectionViewCell.swift
//  SpaceXApp
//
//  Created by Baris Saraldi on 15.06.2021.
//

import UIKit
import Kingfisher

class RocketListCollectionViewCell: UICollectionViewCell {
    
    //MARK: UI Components
        
    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var rocketNameLabel: UILabel!
    
        override func awakeFromNib() {
            super.awakeFromNib()
            layer.cornerRadius  = 10
            rocketImage.layer.cornerRadius = layer.cornerRadius
            layer.shadowOpacity = 1
            layer.shadowOffset = CGSize(width: 1, height: 1)
        }
        
    //MARK: UI Functions
        
    func configure (with name: String, with image:String, with year:String, with rocketName: String) {
            nameLabel.text = name
            yearLabel.text = year
            rocketNameLabel.text = rocketName
            rocketImage.kf.setImage(with: URL(string: image))
        }
    }

