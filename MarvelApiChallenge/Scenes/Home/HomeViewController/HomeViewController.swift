//
//  HomeViewController.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 23/03/23.
//

import UIKit

class HomeViewController: UIViewController {
        
    var homeScreen = HomeScreen()
    
    let heroes = [
        HomeModels.CellViewData(name: "Capitão America", image: UIImage(named: Images.banner)),
        HomeModels.CellViewData(name: "Pardal", image: UIImage(named: Images.banner)),
        HomeModels.CellViewData(name: "Omereo", image: UIImage(named: Images.banner)),
        HomeModels.CellViewData(name: "Pirata", image: UIImage(named: Images.banner)),
        HomeModels.CellViewData(name: "Martelo", image: UIImage(named: Images.banner)),
        HomeModels.CellViewData(name: "Antena", image: UIImage(named: Images.banner)),
    ]
    
    override func loadView() {
       view = homeScreen
        homeScreen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = homeScreen.collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.indentifier, for: indexPath) as? HomeCell else {
            return UICollectionViewCell()
        }
        cell.viewData = heroes[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/2 - 32, height: UIScreen.main.bounds.width * 0.8)
    }
    
}


