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
        title = Constants.rocketDetailViewControllerTitle
    }
    
    func setupContent() {
        nameLabel.text = "Rocket Name: \(rockets?.rocket.rocket_name ?? Constants.nilValue)"
        missionName.text = "Mission Name: \(rockets?.mission_name ?? Constants.nilValue)"
        detailLabel.text = rockets?.details
        yearLabel.text = "Launch Year: \(rockets?.launch_year ?? Constants.nilValue)"
        rocketImage.kf.setImage(with: URL(string: rockets?.links.mission_patch ?? Constants.nilValue))
    }
}

