//
//  HomeViewController.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 23/03/23.
//

import UIKit

class HomeViewController: UIViewController {
        
    var homeScreen = HomeScreen()

    override func loadView() {
       view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}


