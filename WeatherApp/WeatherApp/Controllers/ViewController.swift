//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

protocol weatherLocationDelegate: AnyObject {
  func didInsertLocation (_ location: String)
}

class ViewController: UIViewController {
    
    weak var delegate: weatherLocationDelegate?
    
    
    var location = ""
    
    var weather = [Climate]() {
        didSet {
            DispatchQueue.main.async {
                self.mainView.collectionView.reloadData()
            }
        }
    }
    
    private var pictureCount = Int() {
        didSet {
            
        }
    }
    
    
    var pictures = [Hits]() {
        didSet {
            
        }
    }
    
    
    
    var latLong = "" {
        didSet {

        }
        
    }
    
    
    var mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        navigationItem.title = "Weather"
        mainView.zipField.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.collectionView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellWithReuseIdentifier: "weatherCell")
    }
    
    
    
    func getZipCode(search: String) {
        ZipCodeHelper.getLatLongName(fromZipCode: search) { (result) in
            switch result {
            case .failure(let appError):
                print("app error \(appError)")
            case .success(let latLongName):
                self.latLong = "\(latLongName.lat),\(latLongName.long)"
                self.mainView.locationLabel.text = "Weather Forecast for \(latLongName.placeName)"
                self.location = latLongName.placeName
                self.loadImages(for: latLongName.placeName)
                WeatherAPIClient.getWeather(latLong: self.latLong) { (result) in
                    switch result {
                    case .failure(let appError):
                        print("app error \(appError)")
                    case .success(let climate):
                        self.weather = climate
                    
                    }
                }
            }
        }
    }
    
    func loadImages(for search: String) {
        PhotosAPIClient.getPhotos(searchQuery: search) { (result) in
            switch result {
            case .failure(let appError):
                print("app error \(appError)")
            case .success(let image):
                self.pictures = image
            }
        }
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? WeatherCell else {
            fatalError("could not get cell")
        }
        let climate = weather[indexPath.row]
        cell.backgroundColor = .systemGray4
        cell.configure(for: climate)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let climate = weather[indexPath.row]
        
        let detailViewController = DetailViewController()
        let index = pictures.count - 1
        if !pictures.isEmpty {
        let pictureImage = pictures[Int.random(in: 0...index)]
            detailViewController.picture = pictureImage
        }
        detailViewController.weather = climate
        detailViewController.theLocation = location
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        getZipCode(search: textField.text!)
        return true
    }
}

extension Double {
    func timeConverter() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "EEEE, MMM d"
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
    
    func timeConverterTwo() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.dateFormat = "HH:mm a"
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }

    
}
