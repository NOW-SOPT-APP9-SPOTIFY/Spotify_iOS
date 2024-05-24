//
//  ArtistPopularMusicModel.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/24/24.
//

import UIKit

struct ArtistPopularMusicModel {
    let title: String
    let image: UIImage
    let yearOfRelease: Int
}

extension ArtistPopularMusicModel {
    static func dummyData() -> [ArtistPopularMusicModel] {
        return [
            ArtistPopularMusicModel(title: "Unorthodox Jukebox", image: .imgAlbumUnorthodoxJukebox, yearOfRelease: 2012),
            ArtistPopularMusicModel(title: "24K Magic", image: .imgAlbum24KMagic, yearOfRelease: 2016),
            ArtistPopularMusicModel(title: "Doo-Wops & Hooligans", image: .imgAlbumDooWops, yearOfRelease: 2010),
            ArtistPopularMusicModel(title: "An Evening With Silk Sonic", image: .imgAlbumSilkSonic, yearOfRelease: 2021)
        ]
    }
}
