//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by PEDRO MENDEZ on 16/11/23.
//

import Foundation

enum RMSearchResultViewModel{
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
