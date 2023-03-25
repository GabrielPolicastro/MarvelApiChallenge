//
//  NetworkProvider.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 24/03/23.
//

import Moya
import UIKit

final class NetworkProvider<RequestType: TargetType> {
    
    private let provider: MoyaProvider<RequestType>
    
    init(stubClosure: @escaping MoyaProvider<RequestType>.StubClosure = MoyaProvider.neverStub) {
        self.provider = MoyaProvider<RequestType>(stubClosure: stubClosure)
    }
    
    func request<ResponseType: Decodable>(_ target: RequestType, completion: @escaping (Result<ResponseType, NetworkErrors>) -> Void) {
        
        provider.request(target) { result in
            switch result {
            case.success(let response):
                do {
                    let responseModel = try response.map(ResponseType.self)
                    completion(.success(responseModel))
                } catch {
                    completion(.failure(NetworkErrors.decoding))
                }
            case .failure:
                completion(.failure(NetworkErrors.generic))
            }
        }
    }
    
    func requestImage(_ target: RequestType, completion: @escaping (Result<UIImage?, NetworkErrors>) -> Void) {
        
        provider.request(target) { result in
            switch result {
            case.success(let response):
                let responseModel = UIImage(data: response.data)
                completion(.success(responseModel))
            case .failure(let error):
                print(error)
                completion(.failure(NetworkErrors.generic))
            }
        }
    }
}
