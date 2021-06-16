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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    private func setupUI() {
        rocketImage.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width / 2 , height: contentView.frame.size.height  )
        nameLabel.frame = CGRect(x: rocketImage.frame.width + 50, y:0, width: rocketImage.frame.width / 2 ,height: rocketImage.frame.height / 2)
        rocketNameLabel.frame = CGRect(x: rocketImage.frame.width + 50, y:50, width:  rocketImage.frame.width / 2 ,height: rocketImage.frame.height / 2 )
        yearLabel.frame = CGRect(x: rocketImage.frame.width + 50, y:100, width: rocketImage.frame.width / 2 ,height: rocketImage.frame.height / 2)
    }
        
    //MARK: UI Functions
        
    func configure (with name: String, with image:String, with year:String, with rocketName: String) {
            nameLabel.text = name
            yearLabel.text = year
            rocketNameLabel.text = rocketName
            rocketImage.kf.setImage(with: URL(string: image))
        }
    }

