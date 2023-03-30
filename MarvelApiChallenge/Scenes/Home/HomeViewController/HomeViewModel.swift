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
    var heroes = [HomeModels.CellViewData]()
    var heroesFilter = [HomeModels.CellViewData]()
    
    
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
                self?.heroes = response
                self?.heroesFilter = response
                self?.delegate?.presentSuccess(result: response)
            case .failure:
                self?.delegate?.presentError()
            }
        }
    }
    
   func heroesSearch(searchText: String) {
        if searchText != "" {
            
            heroesFilter = heroes.filter({ hero in
                return hero.name.lowercased().contains(searchText.lowercased())
            }).sorted{$0.name < $1.name}
        } else {
            self.heroesFilter = heroes
        }
        self.delegate?.presentSuccess(result: heroesFilter)
    }
}

