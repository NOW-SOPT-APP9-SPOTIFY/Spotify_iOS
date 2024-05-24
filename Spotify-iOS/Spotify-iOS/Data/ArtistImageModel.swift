//
//  ArtistImageModel.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/24/24.
//

import UIKit

struct ArtistImageModel {
    let image: UIImage
}

extension ArtistImageModel {
    static func albumImages() -> [UIImage] {
        return [
            .imgAlbumUnorthodoxJukebox,
            .imgAlbum24KMagic,
            .imgAlbumDooWops,
            .imgAlbumSilkSonic
        ]
    }
}
