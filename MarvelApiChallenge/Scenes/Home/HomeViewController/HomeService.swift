//
//  HomeService.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 24/03/23.
//

class HomeService {
    
    let networkProvider: NetworkProvider<HomeModels.GetHeroesRequest>
    
    init(networkProvider: NetworkProvider<HomeModels.GetHeroesRequest>) {
        self.networkProvider = networkProvider
    }
    
    func fetchHeroes(completion: @escaping (Result<[Hero], NetworkErrors>) -> Void) {
        let request = HomeModels.GetHeroesRequest()
        networkProvider.request(request) { (response: Result<HomeModels.SearchCharacters, NetworkErrors>) in
            switch response {
            case .success(let success):
                completion(.success(success.data.results))
            case .failure(let failure):
                print(failure)
                completion(.failure(.generic))
            }
        }
    }
}
