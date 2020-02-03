//
//  TabController.swift
//  WeatherApp
//
//  Created by Oscar Victoria Gonzalez  on 1/30/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class TabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstViewController = UINavigationController(rootViewController: ViewController()) 
        
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let secondViewController = FavoritesViewController()
        
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        let tabBarList = [firstViewController, secondViewController]
        
        viewControllers = tabBarList
        
    }
    
}
