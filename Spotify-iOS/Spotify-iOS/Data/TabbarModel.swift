//
//  TabbarModel.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/20/24.
//

import Foundation

struct TabbarModel {
    let title: String
}

extension TabbarModel {
    static func tabbarData() -> [TabbarModel] {
        return [
            TabbarModel(title: "음악"),
            TabbarModel(title: "이벤트"),
            TabbarModel(title: "Merch"),
        ]
    }
}
