//
//  FavoritesViewController.swift
//  WeatherApp
//
//  Created by Oscar Victoria Gonzalez  on 1/30/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import ImageKit
import DataPersistence

class DetailViewController: UIViewController {
    
    public var persistence = DataPersistence<Hits>(filename: "images.plist")
    
    var theLocation = ""
    
    var picture: Hits?
    
    var weather: Climate?
    
    var detail = DetailView()
    
    override func loadView() {
        view = detail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavBar()
        updatUI()
        loadPhotos()
    }
    
    

    func updatUI() {
        guard let climate = weather else {
            fatalError("could not get photo")
        }
        detail.descriptionLabel.text = climate.icon
        detail.highTemeperatureLabel.text = "High: \(climate.temperatureHigh.description) ℉"
        detail.lowTemperatureLabel.text = "Low: \(climate.temperatureLow.description) ℉"
        detail.sunriseLabel.text = climate.sunriseTime.timeConverter()
        detail.sunsetLabel.text = climate.sunsetTime.timeConverter()
        detail.windspeedLabel.text = "Windspeed: \(climate.windSpeed.description) MPH"
        
    }
    
    func loadPhotos() {
        guard let image = picture?.largeImageURL else { return }
        
        detail.cityImage.getImage(with: image) { (result) in
            switch result {
            case .failure(let appError):
                print("app error \(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.detail.cityImage.image = image
                }
            }
        }
   
    }
    
    
    func configureNavBar() {
        let saveBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(savePhoto))
        self.navigationItem.rightBarButtonItem  = saveBarButtonItem
    }
    
    @objc
    private func savePhoto(_ semder: UIBarButtonItem) {
        do {
            guard let theImage = picture else { return }
            try persistence.createItem(theImage)
            print("image succesfully saved!")
        } catch {
            print("could not save")
        }
        
    }
}





