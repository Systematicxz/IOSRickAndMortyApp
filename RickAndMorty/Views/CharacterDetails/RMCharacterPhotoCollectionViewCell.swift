//
//  RMCharacterPhotoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by PEDRO MENDEZ on 31/10/23.
//

import UIKit

final  class RMCharacterPhotoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifer = "RMCharacterPhotoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpConstraints() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with viewModel: RMCharacterPhotoCollectionViewCellViewModel) {
        
    }
}
