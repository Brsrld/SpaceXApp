//
//  RocketDetailViewController.swift
//  SpaceXApp
//
//  Created by Baris Saraldi on 16.06.2021.
//

import UIKit

class RocketDetailViewController: UIViewController {
    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var missionName: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    var rockets:RocketModels?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContent()
    }
    
    func setupContent() {
        nameLabel.text = rockets?.rocket.rocket_name
        missionName.text = rockets?.mission_name
        detailLabel.text = rockets?.details
        yearLabel.text = rockets?.launch_year
        rocketImage.kf.setImage(with: URL(string: rockets?.links.mission_patch ?? Constants.nilValue))
    }
}

