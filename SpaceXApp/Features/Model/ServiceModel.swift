//
//  ServiceModel.swift
//  SpaceXApp
//
//  Created by Baris Saraldi on 15.06.2021.
//

import Foundation

struct RocketModels: Codable {
    let mission_name: String?
    let launch_year: String?
    let rocket: Rocket
    let links: RocketLink
    let details: String?
}


