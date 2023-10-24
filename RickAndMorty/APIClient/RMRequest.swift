//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by PEDRO MENDEZ on 23/10/23.
//

import Foundation

//Object that represents a single API call
//Base url
// Endpoint
//Path components
//Querry parameters

final class RMRequest {
    // API constants
    private struct Constans {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    // Desired endpoint
    private let endpoint: RMEndpoint
    
    // Path conpoments API, if any
    private let pathComponents: [String]
    
    
    //Querry arguments for API, if any
    private let querryParameters: [URLQueryItem]
    
    //Constructed url for the api req in string format
    private var urlString: String {
        var string = Constans.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        if !querryParameters.isEmpty {
            string += "?"
            let argumentString = querryParameters.compactMap({
                guard let value = $0.value else { return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        return string
    }
    
    // Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    //Desired http method
    public let httpMethod = "GET"
    
    //- MARK: Public
    
    //Construct req
    //// -Parameters
    //// --endpoint: Target endpoint
    //// -pathComponents: Collection of path components
    /// -querryParameters: Collections of query parameters
    
    
    public init(
         endpoint: RMEndpoint,
         pathComponents: [String] = [],
         querryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents  = pathComponents
        self.querryParameters = querryParameters
    }
}

extension RMRequest {
    static let listCharactersRequests = RMRequest(endpoint: .character)
}
