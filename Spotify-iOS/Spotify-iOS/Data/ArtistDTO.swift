//
//  ArtistDetailDTO.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/24/24.
//

import Foundation

struct ArtistDetailDTO: Codable {
    let id: Int
    let artistName: String
    let songs: [ArtistSong]
}

struct ArtistChartDTO: Codable {
    let songs: [ArtistSong]
}

struct ArtistSong: Codable {
    let id: Int
    let title: String
    let listenedCount: Int
}
