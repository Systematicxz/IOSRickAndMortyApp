//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by PEDRO MENDEZ on 10/11/23.
//

import Foundation

protocol RMLocationViewViewModelDelegate: AnyObject {
    func didFetchInitialLocations()
}

final class RMLocationViewViewModel {
    
    weak var delegate: RMLocationViewViewModelDelegate?
    
    private var locations: [RMLocation] = [] {
        didSet {
            for location in locations {
                let cellViewModel = RMLocationTableViewCellViewModel(location: location)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
            }
        }
    }
    
    // Location response info
    // Will contain next utl. if present
    
    private var apiInfo: RMGetAllLocationsResponse.Info?
    
    public private(set) var cellViewModels: [RMLocationTableViewCellViewModel] = []
    
    public var shouldShowLoadMoreIndicator: Bool {
        return apiInfo?.next != nil
      }
    
    public var isLoadingMoreLocations = false 
    
    init() {}
    
    // Paginate if additional locatios are needed
    
    public func fetchAdditionalLocations() {
        guard !isLoadingMoreLocations else {
            return
        }
        guard let nextUrlString = apiInfo?.next,
              let url = URL(string: nextUrlString) else {
                  return
              }
        isLoadingMoreLocations = true
    
        guard let request = RMRequest(url: url) else {
            isLoadingMoreLocations = false
            return
        }
        
        RMService.shared.execute(request,
                                 expecting: RMGetAllLocationsResponse.self) { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            switch result {
            case .success(let responseModel):
                let moreResults = responseModel.results
                let info = responseModel.info
                print("More  locations: \(moreResults.count)")
                strongSelf.apiInfo = info
                strongSelf.cellViewModels.append(contentsOf: moreResults.compactMap({
                    return RMLocationTableViewCellViewModel(location: $0)
                }))
                DispatchQueue.main.async {
                 strongSelf.isLoadingMoreLocations = false
                }
            case .failure(let failure):
                print(String(describing: failure))
                self?.isLoadingMoreLocations = false
            }
        }
    }

    
    public func location(at index: Int) -> RMLocation? {
        guard index < locations.count, index >= 0 else {
            return nil
        }
        return self.locations[index]
    }
    
    public func fetchLocations() {
        RMService.shared.execute(
            .listLocationsRequest,
            expecting: RMGetAllLocationsResponse.self
        ) {  [weak self] result in
            switch result{
            case .success(let model):
                self?.apiInfo = model.info
                self?.locations = model.results
                DispatchQueue.main.async {
                    self?.delegate?.didFetchInitialLocations()
                }
            case .failure:
                break
            }
        }
    }
    
    private var hasMoreResults: Bool {
        return false
    }
}
