//
//  FavoritesViewController.swift
//  WeatherApp
//
//  Created by Oscar Victoria Gonzalez  on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var favorites = FavoritesView()
    
    override func loadView() {
        view = favorites
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        favorites.collectionView.delegate = self
        favorites.collectionView.dataSource = self
        favorites.collectionView.register(UINib(nibName: "PictureCell", bundle: nil), forCellWithReuseIdentifier: "pictureCell")
    }
    
}

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pictureCell", for: indexPath)
        cell.backgroundColor = .systemBlue
        return cell
    }

}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//         override the default items of the itemSize layout from the collectionView property initializer in the PodcastView
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width * 0.90
        return CGSize(width: itemWidth, height: 350)
}
}
