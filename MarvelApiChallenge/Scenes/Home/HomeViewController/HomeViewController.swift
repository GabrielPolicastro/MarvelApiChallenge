//
//  HomeViewController.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 23/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeScreen = HomeScreen()
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
        homeScreen.didChangeTextAction = { [weak self] searchText in
            self?.viewModel.heroesSearch(searchText: searchText)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchHeroes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func presentSuccess(result: [HomeModels.CellViewData]) {
        self.homeScreen.collectionView.reloadData()
    }
    
    func presentError() {
        print("error")
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.heroesViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = homeScreen.collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.indentifier, for: indexPath) as? HomeCell else {
            return UICollectionViewCell()
        }
        cell.viewData = viewModel.heroesViewData[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? HomeCell,
              let image = cell.imageView.image else {
            return
        }
        let hero = viewModel.heroesFiltered[indexPath.row]
        let heroDetailViewData = HomeDetailModels.createViewData(hero: hero, image: image)
        let vc = HomeDetailViewController(hero: heroDetailViewData)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/2 - 32, height: UIScreen.main.bounds.width * 0.8)
    }
}

