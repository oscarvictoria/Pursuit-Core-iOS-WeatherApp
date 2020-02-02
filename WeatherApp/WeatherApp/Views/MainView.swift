//
//  MainView.swift
//  WeatherApp
//
//  Created by Oscar Victoria Gonzalez  on 1/30/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    public lazy var enterLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter a Zip Code"
        label.backgroundColor = .systemGray4
        return label
    }()
    
    public lazy var zipField: UITextField = {
        let zipField = UITextField()
        zipField.backgroundColor = .systemOrange
        zipField.textAlignment = .center
        zipField.placeholder = "Zip Code"
        return zipField
    }()
    
    public lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather"
        label.textAlignment = .center
        label.backgroundColor = .systemBlue
        return label
    }()
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 130, height: 140)
//        layout.minimumLineSpacing = 0.0
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemGray4
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
         super.init(coder: coder)
         commonInit()
     }
  
    func commonInit() {
        configureLocationLabel()
        configureCollectionView()
        configureTextField()
        configurLabel()
    }
    
    func configureCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            collectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2)
        ])
    }
    
    func configureLocationLabel() {
        addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            locationLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            locationLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            locationLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureTextField() {
        addSubview(zipField)
        zipField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            zipField.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30),
            zipField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 140),
            zipField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -140)
        ])
    }
    
    func configurLabel() {
        addSubview(enterLabel)
        enterLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            enterLabel.topAnchor.constraint(equalTo: zipField.bottomAnchor, constant: 8),
            enterLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

}
