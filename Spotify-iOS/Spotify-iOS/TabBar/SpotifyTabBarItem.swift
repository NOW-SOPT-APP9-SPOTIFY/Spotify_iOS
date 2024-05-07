//
//  SpotifyTabBarItem.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/7/24.
//

import UIKit

enum SpotifyTabBarItem {
    case home
    case search
    case myLibrary
    case premium
    
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .search:
            return "검색하기"
        case .myLibrary:
            return "내 라이브러리"
        case .premium:
            return "프리미엄"
        }
    }
    
    var unselectedImage: UIImage {
        switch self {
        case .home:
            return UIImage(systemName: "house")!
        case .search:
            return UIImage(systemName: "house")!
        case .myLibrary:
            return UIImage(systemName: "house")!
        case .premium:
            return UIImage(systemName: "house")!
        }
    }
    
    var selectedImage: UIImage {
        switch self {
        case .home:
            return UIImage(systemName: "house.fill")!
        case .search:
            return UIImage(systemName: "house.fill")!
        case .myLibrary:
            return UIImage(systemName: "house.fill")!
        case .premium:
            return UIImage(systemName: "house.fill")!
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return ViewController()
        case .search, .myLibrary, .premium:
            return ViewController()
        }
    }
}
