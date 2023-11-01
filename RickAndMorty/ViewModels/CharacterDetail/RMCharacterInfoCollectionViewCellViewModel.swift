//
//  RMCharacterInfoCollectionViewModel.swift
//  RickAndMorty
//
//  Created by PEDRO MENDEZ on 31/10/23.
//

import Foundation

final class RMCharacterInfoCollectionViewCellViewModel {
    public let value: String
    public let title: String
    
    init(
        value: String,
        title: String
    ) {
        self.value = value
        self.title = title
        
    }
}
