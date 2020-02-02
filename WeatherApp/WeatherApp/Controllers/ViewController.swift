//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var photos = [Hits]() {
        didSet {
            
        }
    }
    
    
    var weather = [Climate]() {
        didSet {
            DispatchQueue.main.async {
                self.mainView.collectionView.reloadData()
            }
        }
    }
    
    var latLong = "" {
        didSet {
            WeatherAPIClient.getWeather(latLong: latLong) { (result) in
                switch result {
                case .failure(let appError):
                    print("error \(appError)")
                case .success(let climate):
                    self.weather = climate
                }
            }
            
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
        mainView.zipField.text = 10467.description
//        loadPicture()
    }
    

    
    func getZipCode(search: String) {
        ZipCodeHelper.getLatLongName(fromZipCode: search) { (result) in
            switch result {
            case .failure(let appError):
                print("app error \(appError)")
            case .success(let latLong):
                self.latLong = "\(latLong.lat),\(latLong.long)"
                self.mainView.locationLabel.text = latLong.placeName
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
        
        let favoritesViewController = FavoritesViewController()
        favoritesViewController.weather = climate
       
        navigationController?.pushViewController(favoritesViewController, animated: true)
    }
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        getZipCode(search: textField.text!)
        print(latLong)
        return true
    }
}

extension Double {
  func timeConverter() -> String {
    let date = Date(timeIntervalSince1970: self)
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = DateFormatter.Style.short
      dateFormatter.dateStyle = DateFormatter.Style.short
      dateFormatter.timeZone = .current
      let localDate = dateFormatter.string(from: date)
      return localDate
    }
}
