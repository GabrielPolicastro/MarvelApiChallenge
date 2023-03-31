//
//  HomeDetailViewController.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 29/03/23.
//

import UIKit

class HomeDetailViewController: UIViewController {
    
    var homeDetailScreen = HomeDetailScreen()
    var detailViewModel: DetailViewModel
    
    init(hero: Hero) {
        self.detailViewModel = DetailViewModel(hero: hero)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = homeDetailScreen
        self.view = self.homeDetailScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 1.0) {
            self.homeDetailScreen.frame.origin.x += 100
        }
    }
}
    
