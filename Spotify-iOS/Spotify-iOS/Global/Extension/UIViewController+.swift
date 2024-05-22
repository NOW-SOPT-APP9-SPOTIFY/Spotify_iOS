//
//  UIViewController+.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/22/24.
//

import UIKit

extension UIViewController {
    
    var tabBarHeight: CGFloat {
        if let tabBarHeight = self.tabBarController?.tabBar.frame.size.height {
            return tabBarHeight
        }
        return 50
    }
    
    func bottomInset() -> CGFloat {
        return tabBarHeight + safeAreaBottomInset()
    }
    
    func safeAreaBottomInset() -> CGFloat {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return scene?.windows.first?.safeAreaInsets.bottom ?? 0
    }
}
