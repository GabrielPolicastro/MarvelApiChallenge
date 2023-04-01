//
//  HomeDetailScreen.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 29/03/23.
//

import UIKit


class HomeDetailScreen: UIView {
    
    var viewData: HomeDetailModels.HomeDetailViewData? {
        didSet {
            nameLabel.text = viewData?.name
            imageView.image = viewData?.image
            textDescriptionLabel.text = viewData?.description
        }
    }
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.shadowColor = UIColor(red: 0/255, green: 255/255, blue: 10/255, alpha: 1).cgColor
//        view.layer.shadowOffset = CGSize(width: 0, height: 2)
//        view.layer.shadowOpacity = 0.15
//        view.layer.shadowRadius = 4
//        view.layer.masksToBounds = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        return img
    }()
    
    lazy var favoritedBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(named: "favorited")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .yellow
        return btn
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private lazy var textDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
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
    
    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.locations = [0.6, 1]
        return gradient
    }()
    
    private let selectMonthLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.locations = [0.65, 1]
        return gradient
    }()
    
    private func setupGradient() {
        let initialColor = UIColor.clear
        let finalColor = UIColor.black.withAlphaComponent(0.7)
        gradientLayer.colors = [initialColor.cgColor, finalColor.cgColor]
        gradientLayer.frame = bounds
        selectMonthLayer.colors = [initialColor.cgColor, finalColor.cgColor]
        selectMonthLayer.frame = bounds
    }
    
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
        layer.addSublayer(gradientLayer)
        cardView.addSubview(imageView)
        cardView.addSubview(favoritedBtn)
        cardView.layer.addSublayer(selectMonthLayer)
        addSubview(cardView)
        addSubview(descriptionStackView)
        addSubview(nameLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 400),
            
            imageView.topAnchor.constraint(equalTo: cardView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            
            favoritedBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            favoritedBtn.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -42),
            favoritedBtn.heightAnchor.constraint(equalToConstant: 45),
            favoritedBtn.widthAnchor.constraint(equalToConstant: 45),
                        
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16),
            
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




//    lazy var overlayView: UIView = {
//        let v = UIView()
//        v.translatesAutoresizingMaskIntoConstraints = false // n eh necessario com snpkit
//        v.backgroundColor = UIColor.black.withAlphaComponent(0.2)
//        return v
//    }()
