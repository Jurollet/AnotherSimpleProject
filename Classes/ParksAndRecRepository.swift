//
//  ParksAndRecRepository.swift
//  AnotherSimpleProject
//
//  Created by Julien Rollet on 25/02/2020.
//

import Foundation
import Alamofire

class ParksAndRecRepository {

    var allParksUrl = "https://download.data.grandlyon.com/ws/grandlyon/lyon.parcjardin_latest/all.json?maxfeatures=100&start=1"

    private let restParksMapper = RestParksMapper()

    func getAllParks(completion: @escaping (Result<[Park]>) -> Void) {
        Alamofire.request(allParksUrl).responseJSON { responseJson in
            if let error = responseJson.error {
                completion(.failure(error))
                return
            }
            guard
                let json = responseJson.value as? [String : Any],
                let restParks = RestParks(with: json) else {
                    return
            }
            let parks = self.restParksMapper.mapToEntity(restParks)
            completion(.success(parks))
        }
    }
}
