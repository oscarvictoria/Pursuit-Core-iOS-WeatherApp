//
//  FavoritesView.swift
//  WeatherApp
//
//  Created by Oscar Victoria Gonzalez  on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    public lazy var windspeedLabel: UILabel = {
        let label = UILabel()
        label.text = "Wind Speed"
        label.textAlignment = .center
        return label
    }()
    
    public lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunset"
        label.textAlignment = .center
        return label
    }()
    
    public lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunrise"
        label.textAlignment = .center
        return label
    }()
    
    public lazy var lowTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "low temperature"
        label.textAlignment = .center
        return label
    }()
    
    public lazy var highTemeperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "High"
        label.textAlignment = .center
        return label
    }()
    
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
    
    public lazy var nameAndDateLabel: UILabel = {
        let label = UILabel()
        label.text = "The temperature for is"
        label.numberOfLines = 0
        return label
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
        configureNameAndDate()
        configuredCityImage()
        configuredDescriptionLabel()
        configuredHighLabel()
        configurelowLabel()
        configuredSunriseLabel()
        configureSunsetLabel()
        configureWindSpeedLabel()
    }
    
    func configuredCityImage() {
        addSubview(cityImage)
        cityImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityImage.topAnchor.constraint(equalTo: nameAndDateLabel.bottomAnchor, constant: 20),
            cityImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            cityImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
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
    
    func configuredHighLabel() {
        addSubview(highTemeperatureLabel)
        highTemeperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            highTemeperatureLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            highTemeperatureLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 100),
            highTemeperatureLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100)
            
        ])
    }
    
    func configurelowLabel() {
        addSubview(lowTemperatureLabel)
        lowTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lowTemperatureLabel.topAnchor.constraint(equalTo: highTemeperatureLabel.bottomAnchor, constant: 8),
            lowTemperatureLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 100),
            lowTemperatureLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100)
        ])
    }
    
    func configuredSunriseLabel() {
        addSubview(sunriseLabel)
        sunriseLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sunriseLabel.topAnchor.constraint(equalTo: lowTemperatureLabel.bottomAnchor, constant: 8),
            sunriseLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 100),
            sunriseLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100)
        ])
    }
    
    func configureSunsetLabel() {
        addSubview(sunsetLabel)
        sunsetLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sunsetLabel.topAnchor.constraint(equalTo: sunriseLabel.bottomAnchor, constant: 8),
            sunsetLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 100),
            sunsetLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100)
        ])
    }
    
    func configureWindSpeedLabel() {
        addSubview(windspeedLabel)
        windspeedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            windspeedLabel.topAnchor.constraint(equalTo: sunsetLabel.bottomAnchor, constant: 8),
            windspeedLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 100),
            windspeedLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100)
            
        ])
    }
    
    func configureNameAndDate() {
        addSubview(nameAndDateLabel)
        nameAndDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameAndDateLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            nameAndDateLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            nameAndDateLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ])
    }
    
}
