//
//  HomeViewModel.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 24/03/23.
//

class HomeViewModel {
    
    let homeService: HomeService
    
    init(homeService: HomeService) {
        self.homeService = homeService
    }
    
    func fetchHeroes(completion: @escaping (Result<[HomeModels.CellViewData], NetworkErrors>) -> Void) {
        homeService.fetchHeroes { (result: Result<[Hero], NetworkErrors>) in
            switch result {
            case .success(let success):
                let response = HomeModels.createViewModel(success)
                completion(.success(response))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
