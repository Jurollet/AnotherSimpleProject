//
//  GetAllParksInteractor.swift
//  AnotherSimpleProject
//
//  Created by Julien Rollet on 25/02/2020.
//

import Foundation
import Alamofire

class GetAllParksInteractor {

    private let parksAndRecRepository = ParksAndRecRepository()

    func execute(completion: @escaping (Result<[Park]>) -> Void) {
        parksAndRecRepository.getAllParks { result -> Void in
            switch result {
            case .success(let parks):
                completion(.success(parks))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
