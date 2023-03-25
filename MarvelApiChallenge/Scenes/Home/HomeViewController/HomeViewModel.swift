//
//  HomeViewModel.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 24/03/23.
//

protocol HomeViewModelDelegate: AnyObject {
    func presentSuccess(result: [HomeModels.CellViewData])
    func presentError()
}

class HomeViewModel {
    
    weak var delegate: HomeViewModelDelegate?
    let homeService: HomeServiceLogic
    
    init(homeService: HomeServiceLogic) {
        self.homeService = homeService
    }
    
    func setDelegate(_ delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }
    
    func fetchHeroes() {
        homeService.fetchHeroes { [weak self] (result: Result<[Hero], NetworkErrors>) in
            switch result {
            case .success(let success):
                let response = HomeModels.createViewModel(success)
                self?.delegate?.presentSuccess(result: response)
            case .failure:
                self?.delegate?.presentError()
            }
        }
    }
}
