//
//  FavoritesView.swift
//  WeatherApp
//
//  Created by Oscar Victoria Gonzalez  on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    public lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Cloudy, light rain"
        label.textAlignment = .center
        return label
    }()
    
    public lazy var cityImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "photo")
        return image
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
        configuredCityImage()
        configuredDescriptionLabel()
    }
    
    func configuredCityImage() {
        addSubview(cityImage)
        cityImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            cityImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            cityImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 8),
            cityImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
        ])
    }
    
    func configuredDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: cityImage.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 100),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100)
        ])
        
    }
  
}
