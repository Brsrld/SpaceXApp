//
//  RocketListViewModel.swift
//  SpaceXApp
//
//  Created by Baris Saraldi on 15.06.2021.
//

import Foundation

//MARK: Protocols

protocol RocketListViewModelProtocol {
    func service(onSuccess: @escaping ([RocketModels]) -> Void, onFail: @escaping (String?) -> Void)
}

//MARK: Model Logic

final class RocketListViewModel:NSObject {
    
    private let rocketService: RocketServiceProtocol = RocketService()
    
    func service(onSuccess: @escaping ([RocketModels]) -> Void, onFail: @escaping (String?) -> Void) {
        rocketService.fethAllPosts(onSuccess: onSuccess, onFail: onFail)
    }
}

extension RocketListViewModel: RocketListViewModelProtocol {}
