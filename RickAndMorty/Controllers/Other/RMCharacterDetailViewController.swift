//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by PEDRO MENDEZ on 26/10/23.
//

import UIKit
// Controller to show info about a single character
final class RMCharacterDetailViewController: UIViewController {
    
    private let viewModel: RMCharacterDetailViewViewModel
    init(viewModel: RMCharacterDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("Unsopported")
    }

    // MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
    }
}
