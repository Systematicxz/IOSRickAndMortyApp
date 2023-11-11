//
//  RMGetLocationsResponse.swift
//  RickAndMorty
//
//  Created by PEDRO MENDEZ on 10/11/23.
//

import Foundation

struct RMGetAllLocationsResponse: Codable {
    struct Info: Codable {
        let count : Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMLocation]
    
}
