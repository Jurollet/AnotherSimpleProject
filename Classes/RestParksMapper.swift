//
//  RestParksMapper.swift
//  AnotherSimpleProject
//
//  Created by Julien Rollet on 25/02/2020.
//

import Foundation

struct RestParksMapper {

    func mapToEntity(_ restParks: RestParks) -> [Park] {
        return restParks.parks.map { mapToEntity($0) }
    }

    func mapToEntity(_ restPark: RestPark) -> Park {
        let accessibilities: [ParkAccessibility]
        if restPark.acces.contains("Piéton") {
            accessibilities = [.pedestrian]
        } else if restPark.acces.contains("Vélo") {
            accessibilities = [.bike]
        } else if restPark.acces.contains("Piéton/Vélo") {
            accessibilities = [.pedestrian, .bike]
        } else {
            accessibilities = []
        }
        return Park(
            accessibility: accessibilities,
            postCode: restPark.codepost,
            city: restPark.commune,
            name: restPark.nom,
            totalSurface: restPark.surfTotM2
        )
    }
}
