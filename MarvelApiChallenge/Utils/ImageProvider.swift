//
//  ImageProvider.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 25/03/23.
//

import Moya
import Foundation
import UIKit

struct ImageRequest: TargetType {
    var baseURL: URL
    
    var path: String = ""
    
    var method: Moya.Method = Moya.Method.get
    
    var task: Moya.Task = .requestParameters(parameters: [:], encoding: URLEncoding.default)
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
    
    static var parameters: String {
        "?ts=\(Constants.timeStamp)&apikey=\(Constants.apiKey)&hash=\(Constants.hash)"
    }
}

class ImageProvider {
    
    let networkProvider: NetworkProvider<ImageRequest>
    
    init(networkProvider: NetworkProvider<ImageRequest> = NetworkProvider<ImageRequest>()) {
        self.networkProvider = networkProvider
    }
    
    func fetchImage(imageURL: URL, completion: @escaping (UIImage?) -> Void) {
        let request = ImageRequest(baseURL: imageURL)
        networkProvider.requestImage(request) { response in
            switch response {
            case .success(let success):
                completion(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
