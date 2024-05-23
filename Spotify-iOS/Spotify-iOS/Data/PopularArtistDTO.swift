//
//  PopularArtistDTO.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/23/24.
//

import Foundation

struct ArtistsDTO: Codable {
    let status: Int
    let message: String
    let data: [Artist]
}

// MARK: - Datum
struct Artist: Codable {
    let id: Int
    let artistName: String
}
