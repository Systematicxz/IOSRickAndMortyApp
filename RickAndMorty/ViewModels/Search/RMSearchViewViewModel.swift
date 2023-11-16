//
//  RMSearchViewViewModel.swift
//  RickAndMorty
//
//  Created by PEDRO MENDEZ on 11/11/23.
//

import Foundation

final class RMSearchViewViewModel {
    let config: RMSearchViewController.Config
    private var optionMap: [RMSearchInputViewViewModel.DynamicOption: String] = [:]
    private var searchText = ""
    
    private var optionMapUpdateblock: (((RMSearchInputViewViewModel.DynamicOption, String)) -> Void)?
    
    private var searchResultHandler: (() -> Void)?
    
    // MARK: - Init
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
    
    // MARK: - Public
    
    public func registerSearchResultHandler(_ blocl: @escaping () -> Void) {
        self.searchResultHandler = blocl
    }
    
    public func executeSearch() {
        searchText = "Rick"
        
        
        var queryParams: [URLQueryItem] = [
            URLQueryItem(name: "name", value: searchText)
        
        ]
                
        // Add options
        queryParams.append(contentsOf: optionMap.enumerated().compactMap({_, element in
            let key: RMSearchInputViewViewModel.DynamicOption = element.key
            let value: String = element.value
            return URLQueryItem(name: key.querryArgument, value: value)
        }))
        
        // Create req
        let request = RMRequest(
            endpoint: config.type.endpoint,
            queryParameters: queryParams
        )
        RMService.shared.execute(request, expecting: RMGetAllEpisodesResponse.self) {
            result in
            switch result {
            case .success(let model):
                print("Search results found: \(model.results.count)")
            case .failure:
                break
            }
        }
    }
    
    public func set(querry text: String) {
        self.searchText = text
    }
    
    
    public func set(value: String, for option: RMSearchInputViewViewModel.DynamicOption) {
        optionMap[option] = value
        let tuple = (option, value)
        optionMapUpdateblock?(tuple)
    }
    
    public func registerOptionChangeBlock(_ block: @escaping((RMSearchInputViewViewModel.DynamicOption, String)) -> Void
    ) {
        self.optionMapUpdateblock = block
    }
}
