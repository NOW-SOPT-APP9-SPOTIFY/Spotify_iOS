//
//  PlaylistsDTO.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/23/24.
//

import Foundation

struct PlaylistsDTO: Codable {
    let playlists: [Playlist]
}

struct Playlist: Codable {
    let id: Int
    let playlistName: String
    let artists: [String]
}
