//
//  ViewCode.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 24/03/23.
//

import Foundation

protocol ViewCode {
    func setupView()
    func setupHierarchy()
    func setupConstraints()
    func configureView()
}

extension ViewCode {
    func setupView() {
        setupHierarchy()
        setupConstraints()
        configureView()
    }
    
    func configureView() { }
}
