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
            return .icHome
        case .search:
            return .icSearch
        case .myLibrary:
            return .icLibrary
        case .premium:
            return .icPremium
        }
    }
    
    var selectedImage: UIImage {
        switch self {
        case .home:
            return .icHomeSelected
        case .search:
            return .icSearchSelected
        case .myLibrary:
            return .icLibrarySelected
        case .premium:
            return .icPremiumSelected
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .search, .myLibrary, .premium:
            return ViewController().then { $0.view.backgroundColor = .red }
        }
    }
}
