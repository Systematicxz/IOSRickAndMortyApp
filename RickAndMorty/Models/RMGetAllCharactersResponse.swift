//
//  RMGetCharactersResponse.swift
//  RickAndMorty
//
//  Created by PEDRO MENDEZ on 24/10/23.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct info: Codable {
        let count : Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: info
    let results: [RMCharacter]
    
}

