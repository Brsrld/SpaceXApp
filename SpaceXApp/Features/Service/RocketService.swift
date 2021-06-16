//
//  RocketService.swift
//  SpaceXApp
//
//  Created by Baris Saraldi on 15.06.2021.
//

import Foundation
import Alamofire

//MARK: Protocol

protocol RocketServiceProtocol {
    func fethAllPosts(onSuccess: @escaping ([RocketModels]) -> Void, onFail: @escaping (String?) -> Void)
}

//MARK: Get Datas

struct RocketService: RocketServiceProtocol {
    func fethAllPosts(onSuccess: @escaping ([RocketModels]) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(Constants.apiUrl, method: .get).validate().responseDecodable(of: [RocketModels].self) { (response) in
            guard let items = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
}
