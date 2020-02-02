//
//  FavoritesViewController.swift
//  WeatherApp
//
//  Created by Oscar Victoria Gonzalez  on 1/30/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import ImageKit

class DetailViewController: UIViewController {
    
    var theLocation = ""
    
    var detailView = ViewController()
    
    var weather: Climate?
    
    var detail = DetailView()
    
    override func loadView() {
        view = detail
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
            self.detail.descriptionLabel.text = climate.icon
            self.detail.cityImage.getImage(with: photo) { (result) in
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
        
    }
    
    func loadPhotos() {
//        let location = ViewController()
//        location.delegate = self
        PhotosAPIClient.getPhotos(searchQuery: theLocation) { (result) in
            switch result {
            case .failure(let appError):
                print("app error \(appError)")
            case .success(let photo):
                self.updatUI(photo)
            }
        }
    }
}

extension DetailViewController: weatherLocationDelegate {
    func didInsertLocation(_ location: String) {
        self.theLocation = location
    }
}





