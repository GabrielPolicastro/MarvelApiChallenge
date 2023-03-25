//
//  Hero.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 24/03/23.
//

struct Hero: Decodable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
}

struct Thumbnail: Decodable {
    let path: String
    let extensionImage: Extension
    
    enum CodingKeys: String, CodingKey {
        case path
        case extensionImage = "extension"
    }
    
    func getImageURL() -> String {
        "\(path).\(extensionImage)"
    }
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}
