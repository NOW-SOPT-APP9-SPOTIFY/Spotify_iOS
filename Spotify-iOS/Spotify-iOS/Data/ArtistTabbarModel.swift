//
//  ArtistTabbarModel.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/20/24.
//

import Foundation

struct ArtistTabbarModel {
    let title: String
}

extension ArtistTabbarModel {
    static func tabbarData() -> [ArtistTabbarModel] {
        return [
            ArtistTabbarModel(title: "음악"),
            ArtistTabbarModel(title: "이벤트"),
            ArtistTabbarModel(title: "Merch"),
        ]
    }
}
