//
//  HomeViewController.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 23/03/23.
//

import UIKit

class HomeViewController: UIViewController {
        
    var homeScreen = HomeScreen()
    var heroes = [HomeModels.CellViewData]()
    var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = homeScreen
        homeScreen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchHeroes { (result: Result<[HomeModels.CellViewData], NetworkErrors>) in
            switch result {
            case .success(let heroes):
                self.heroes = heroes
                self.homeScreen.collectionView.reloadData()
            case .failure(let failure):
                // TODO: implementar alerta de erro
                break
            }
        }
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


