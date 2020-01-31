//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var weather = [Climate]() {
        didSet {
            DispatchQueue.main.async {
                self.mainView.collectionView.reloadData()
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
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.collectionView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellWithReuseIdentifier: "weatherCell")
        
        loadData()
        
        
    }
    
    func loadData() {
        WeatherAPIClient.getWeather(latitude:40.7128, longitude: 74.0060) { (result) in
            switch result {
            case .failure(let appError):
                print("app error \(appError)")
            case .success(let climate):
                self.weather = climate
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
    
}
