//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by PEDRO MENDEZ on 23/10/23.
//

import Foundation

//Represents unique API endpoint

@frozen enum RMEndpoint: String {
    
    // Endpoint to get character info
    case character
    //Endpoint to get location info
    case location
    
    //Endopint to get espisode info
    case episode
}
