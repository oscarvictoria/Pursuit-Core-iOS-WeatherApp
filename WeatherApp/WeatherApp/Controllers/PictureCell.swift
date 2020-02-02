//
//  PictureCell.swift
//  WeatherApp
//
//  Created by Oscar Victoria Gonzalez  on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class PictureCell: UICollectionViewCell {
    @IBOutlet weak var cityImage: UIImageView!
    
    
    func configured(for picture: Hits) {
        cityImage.getImage(with: picture.largeImageURL) { (result) in
            switch result {
            case .failure(let appError):
                print("app errro \(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.cityImage.image = image
                }
            }
        }
    }
    
}
