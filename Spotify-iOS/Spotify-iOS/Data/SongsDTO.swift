//
//  SongsDTO.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/23/24.
//

import Foundation

struct SongsDTO: Codable {
    let songs: [Song]
}

struct Song: Codable {
    let id: Int
    let artist: String
    let title: String
}
