//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by PEDRO MENDEZ on 08/11/23.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable, Hashable {
    let id = UUID()

    private let type: RMSettingsOption
//MARK: - Init
    
    init(type: RMSettingsOption) {
        self.type = type
    }
    
//MARK: - Pubic
    
    public var  image: UIImage? {
        return type.iconImage
    }
    public var title: String {
        return type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
}
