//
//  RestPark.swift
//  AnotherSimpleProject
//
//  Created by Julien Rollet on 25/02/2020.
//

import Foundation

struct RestPark {

    let acces: String
    let codepost: String
    let commune: String
    let nom: String
    let surfTotM2: String

    init(withJSON JSON: [String:Any]) {
        acces = JSON["acces"] as? String ?? ""
        codepost = JSON["codepost"] as? String ?? "0"
        commune = JSON["commune"] as? String ?? "Lyon"
        nom = JSON["nom"] as? String ?? ""
        surfTotM2 = JSON["surf_tot_m2"] as? String ?? "0"
    }
}
