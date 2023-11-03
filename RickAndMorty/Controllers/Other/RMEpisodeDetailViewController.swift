//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by PEDRO MENDEZ on 02/11/23.
//

import UIKit
//VC to show details about a single episode
final class RMEpisodeDetailViewController: UIViewController {
    
    private let url: URL?
    // MARK: - Init
    init(url: URL?) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.backgroundColor = .systemMint
    }
}
