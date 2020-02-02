//
//  FavoritesViewController.swift
//  WeatherApp
//
//  Created by Oscar Victoria Gonzalez  on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import DataPersistence

class FavoritesViewController: UIViewController {
    
    var favorites = FavoritesView()
    
    var persistance = DataPersistence<Hits>(filename: "images.plist")
    
    var savedPictures = [Hits]() {
          didSet {
              DispatchQueue.main.async {
                self.favorites.collectionView.reloadData()
              }
          }
      }
     
    override func loadView() {
        view = favorites
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        favorites.collectionView.delegate = self
        favorites.collectionView.dataSource = self
        favorites.collectionView.register(UINib(nibName: "PictureCell", bundle: nil), forCellWithReuseIdentifier: "pictureCell")
        loadPictues()
    }
    
    func loadPictues() {
        do {
            savedPictures = try persistance.loadItems()
        } catch {
            print("could not load images")
        }
    }
    
    
}

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedPictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pictureCell", for: indexPath) as? PictureCell else {
            fatalError("could not get cell")
        }
        let pictures = savedPictures[indexPath.row]
        cell.configured(for: pictures)
        return cell
    }

}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width * 0.90
        return CGSize(width: itemWidth, height: 350)
}
}
