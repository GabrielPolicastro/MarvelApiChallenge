//
//  DetailViewModel.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 31/03/23.
//

import UIKit

struct HomeDetailModels {
    struct HomeDetailViewData {
        let name: String
        let description: String
        let image: UIImage
    }
    
    static func createViewData(hero: Hero, image: UIImage) -> HomeDetailViewData {
        HomeDetailViewData(name: hero.name, description: hero.description, image: image)
    }
}
