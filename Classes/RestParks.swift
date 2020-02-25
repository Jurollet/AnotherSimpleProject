//
//  RestParks.swift
//  AnotherSimpleProject
//
//  Created by Julien Rollet on 25/02/2020.
//

import Foundation

struct RestParks {

    let parks: [RestPark]

    init?(with json: [String : Any]) {
        guard let jsonValues = json["values"] as? [[String : Any]] else { return nil }
        var parks: [RestPark] = []
        for i in 0...jsonValues.count - 1 {
            let a = jsonValues[i]
            let p = RestPark(withJSON: a)
            parks.append(p)
        }
        self.parks = parks
    }
}
