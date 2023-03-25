//
//  HomeModels.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 24/03/23.
//

import UIKit
import Moya

struct HomeModels {
    
    struct SearchCharacters: Decodable {
        let data: DataCharacters
    }

    struct DataCharacters: Decodable {
        let results: [Hero]
    }
    
    struct GetHeroesRequest: TargetType {
        var baseURL: URL = URL(string: Constants.baseURL + parameters)!
        
        var path: String = "characters"
        
        var method: Moya.Method = Moya.Method.get
        
        var task: Moya.Task = .requestParameters(parameters: [:], encoding: URLEncoding.default)
        
        var headers: [String : String]? {
            ["Content-Type": "application/json"]
        }
        
        static var parameters: String {
            "?ts=\(Constants.timeStamp)&apikey=\(Constants.apiKey)&hash=\(Constants.hash)"
        }
    }
    
    struct CellViewData {
        let name: String
        let image: UIImage?
        let imageURL: URL?
    }
    
    static func createViewModel(_ heroList: [Hero]) -> [HomeModels.CellViewData] {
        heroList.compactMap { hero in
            HomeModels.CellViewData(name: hero.name,
                                    image: UIImage.imageWithColor(color: .gray),
                                    imageURL: URL(string: hero.thumbnail.getImageURL()))
        }
    }
    
}
