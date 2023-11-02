//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by PEDRO MENDEZ on 20/10/23.
//

import Foundation

struct RMEpisode: Codable, RMEpisodeDataRender {
    
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
     
