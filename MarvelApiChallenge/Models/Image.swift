//
//  Image.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 24/03/23.
//

import Foundation

struct Image: Decodable {
    let path: String?
    let fileExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case fileExtension = "extension"
    }
}

extension Image {
    
    var url: URL? {
        guard let path = path, let fileExtension = fileExtension else {
            return nil
        }
        return URL(string: "\(path).\(fileExtension)")
    }
}
