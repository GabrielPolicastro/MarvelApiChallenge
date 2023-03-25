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
    var isFavorite: Bool = false
}
