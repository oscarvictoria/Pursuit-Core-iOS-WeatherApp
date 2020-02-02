//
//  FavoritesViewController.swift
//  WeatherApp
//
//  Created by Oscar Victoria Gonzalez  on 1/30/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import ImageKit

class FavoritesViewController: UIViewController {
    
    var photosArray = [String]()
    
    var weather: Climate?
    
    var favoriteView = FavoritesView()
    
    override func loadView() {
        view = favoriteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        loadPhotos()
        
    }
    
    func updatUI(_ photo: String) {
        guard let climate = weather else {
            fatalError("could not get photo")
        }
        DispatchQueue.main.async {
            self.favoriteView.descriptionLabel.text = climate.icon
            self.favoriteView.cityImage.getImage(with: photo ) { (result) in
                switch result {
                case .failure(let appError):
                    print("app error \(appError)")
                case .success(let image):
                    DispatchQueue.main.async {
                        self.favoriteView.cityImage.image = image
                    }
                }
            }
        }
        
    }
    
    
    func loadPhotos() {
        PhotosAPIClient.getPhotos(searchQuery: "Los Angeles") { (result) in
            switch result {
            case .failure(let appError):
                print("app error \(appError)")
            case .success(let photo):
                self.photosArray = [photo.first?.largeImageURL ?? ""]
                self.updatUI(self.photosArray.randomElement() ?? "")
            }
        }
    }
}






