//
//  HomeFactory.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 25/03/23.
//

import UIKit

final class HomeFactory {
    static func createViewController() -> UIViewController {
        let provider = NetworkProvider<HomeModels.GetHeroesRequest>()
        let service = HomeService(networkProvider: provider)
        let viewModel = HomeViewModel(homeService: service)
        let viewController = HomeViewController(viewModel: viewModel)
        viewModel.setDelegate(viewController)
        return viewController
    }
}
