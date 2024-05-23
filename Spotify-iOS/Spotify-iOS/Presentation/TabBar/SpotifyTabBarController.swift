//
//  SpotifyTabBarController.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/7/24.
//

import UIKit

import Then

final class SpotifyTabBarController: UITabBarController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTabBarControllers()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

// MARK: - Methods

extension SpotifyTabBarController {
    private func setUI() {
        tabBar.do {
            $0.backgroundColor = .black
            $0.tintColor = .white
            $0.unselectedItemTintColor = .spotifyGray10

        }
    }
    
    private func setTabBarControllers() {
        let tabBarItems: [SpotifyTabBarItem] = [
            .home,
            .search,
            .myLibrary,
            .premium
        ]
        
        viewControllers = tabBarItems.map { item in
            return templateNavigationController(
                title: item.title,
                unselectedImage: item.unselectedImage,
                selectedImage: item.selectedImage,
                rootViewController: item.viewController
            )
        }
    }
    
    private func templateNavigationController(
        title: String,
        unselectedImage: UIImage?,
        selectedImage: UIImage?,
        rootViewController: UIViewController
    ) -> UINavigationController {
        return UINavigationController(rootViewController: rootViewController).then {
            $0.title = title
            $0.tabBarItem.image = unselectedImage
            $0.tabBarItem.selectedImage = selectedImage
            $0.navigationBar.isHidden = true
        }
    }
}
