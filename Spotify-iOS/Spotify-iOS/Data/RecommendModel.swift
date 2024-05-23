//
//  RecommendDTO.swift
//  Spotify-iOS
//
//  Created by 김민성 on 5/24/24.
//

import Foundation

struct RecommendModel: Codable {
    let status: Int
    let message: String
    let data: Albums
}

struct Albums: Codable {
    let albums: [Album]
}

struct Album: Codable {
    let id: Int
    let albumName: String
    let createdAt: String
    let firstSongName: String
    let artist: Artist
}

struct Artist: Codable {
    let artistId: Int
    let artistName: String
}
