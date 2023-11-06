//
//  RMGetAllEpisodesResponse.swift
//  RickAndMorty
//
//  Created by PEDRO MENDEZ on 06/11/23.
//

import Foundation

struct RMGetAllEpisodesResponse: Codable {
    struct Info: Codable {
        let count : Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMEpisode]
    
}

