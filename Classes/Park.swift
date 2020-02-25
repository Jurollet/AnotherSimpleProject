//
//  Park.swift
//  AnotherSimpleProject
//
//  Created by Julien Rollet on 25/02/2020.
//

import Foundation

enum ParkAccessibility {
    case pedestrian
    case bike
}

struct Park {
    let accessibility: [ParkAccessibility]
    let postCode: String
    let city: String
    let name: String
    let totalSurface: String
}
