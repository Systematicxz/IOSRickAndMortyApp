//
//  Extensions.swift
//  RickAndMorty
//
//  Created by PEDRO MENDEZ on 24/10/23.
//

import UIKit

extension UIView {
    func addSubview(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

extension UIDevice  {
    static let isIphone = UIDevice.current.userInterfaceIdiom == .phone
}
