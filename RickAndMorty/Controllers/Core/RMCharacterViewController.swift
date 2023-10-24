//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by PEDRO MENDEZ on 20/10/23.
//

import UIKit
//Controller to show and search for characters 
final class RMCharacterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        RMService.shared.execute(.listCharactersRequests,
                                 expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: "+String(model.info.count))
                print("Page result count"+String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

//        let request = RMRequest(
//            endpoint: .character,
//            querryParameters:[
//             URLQueryItem(name: "name", value: "rick"),
//             URLQueryItem(name: "status", value: "alive")
//            ]
//        )
//        print(request.url)
//
//        RMService.shared.execute(request,
//                                 expecting: RMCharacter.self) {result in
//            switch result {
//            case .success:
//                break
//            case .failure(let error):
//                print(String(describing: error))
//            }
//        }
