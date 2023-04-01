//
//  HomeDetailViewController.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 29/03/23.
//

import UIKit

class HomeDetailViewController: UIViewController {
    
    var homeDetailScreen = HomeDetailScreen()
    var viewData: HomeDetailModels.HomeDetailViewData
    
    init(hero: HomeDetailModels.HomeDetailViewData) {
        viewData = hero
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = homeDetailScreen
        self.view = self.homeDetailScreen
        homeDetailScreen.viewData = viewData
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
    

    
