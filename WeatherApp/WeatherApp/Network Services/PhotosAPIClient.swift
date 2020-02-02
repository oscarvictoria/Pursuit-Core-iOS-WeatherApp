//
//  PhotosAPIClient.swift
//  WeatherApp
//
//  Created by Oscar Victoria Gonzalez  on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import NetworkHelper

struct PhotosAPIClient {
    static func getPhotos(searchQuery: String, completion: @escaping (Result <String, AppError>)-> ()) {
        let searchQuery = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "Photo"
        let endpointURLString = "https://pixabay.com/api/?key=\(Secrets.PixKey)&q=\(searchQuery)"
        
        guard let url = URL(string: endpointURLString) else {
               completion(.failure(.badURL(endpointURLString)))
               return
           }
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let photos = try JSONDecoder().decode(Photos.self, from: data)
                    completion(.success(photos.hits.first?.largeImageURL ?? ""))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}


