//
//  HomeCell.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 24/03/23.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    static let indentifier = "HomeCell"
    let imageProvider = ImageProvider()
    
    var viewData: HomeModels.CellViewData? {
        didSet {
            imageView.image = viewData?.image
            nameLabel.text = viewData?.name
            guard let imageURL = viewData?.imageURL else {
                return
            }
            imageProvider.fetchImage(imageURL: imageURL) { [weak self] image in
                guard let image = image else {
                    return
                }
                self?.imageView.image = image
            }
        }
    }
    
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.locations = [0.4, 0.8]
        return gradient
    }()
    
    private func setupGradient() {
        let initialColor = UIColor.clear
        let finalColor = UIColor.black.withAlphaComponent(0.8)
        gradientLayer.colors = [initialColor.cgColor, finalColor.cgColor]
        gradientLayer.frame = imageView.bounds
    }
    
    override func layoutSubviews() {
        setupGradient()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeCell: ViewCode {
    func setupHierarchy() {
        addSubview(imageView)
        imageView.layer.addSublayer(gradientLayer)
        addSubview(nameLabel)
    }
    
    func setupConstraints() {
        pin(to: imageView)
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
    
    func configureView() {
        clipsToBounds = true
        layer.cornerRadius = 16
    }
}
