//
//  HomeDetailScreen.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 29/03/23.
//

import UIKit

class HomeDetailScreen: UIView {
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor(red: 0/255, green: 255/255, blue: 10/255, alpha: 1).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.15
        view.layer.shadowRadius = 4
        view.layer.masksToBounds = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.layer.cornerRadius = 10
        return img
    }()
    
    private lazy var favoritedImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.layer.cornerRadius = 10
        return img
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var textDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    private lazy var descriptionStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [textDescriptionLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 5
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeDetailScreen: ViewCode {
    func setupHierarchy() {
        cardView.addSubview(imageView)
        imageView.addSubview(favoritedImageView)
        imageView.addSubview(nameLabel)
        addSubview(descriptionStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 200),
            
            imageView.topAnchor.constraint(equalTo: cardView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            
            favoritedImageView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 16),
            favoritedImageView.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -16),
            favoritedImageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -32),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -16),
            nameLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -16),
            
            descriptionStackView.topAnchor.constraint(equalTo: cardView.bottomAnchor),
            descriptionStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            descriptionStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            descriptionStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            textDescriptionLabel.heightAnchor.constraint(equalToConstant: 120),
            textDescriptionLabel.widthAnchor.constraint(equalToConstant: 120),
            textDescriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textDescriptionLabel.bottomAnchor.constraint(equalTo: descriptionStackView.bottomAnchor)
        ])
    }

    func configureView() {
        backgroundColor = .white
    }
}
