//
//  ArtistServiceType.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/23/24.
//

import Foundation
import Moya

enum ArtistServiceType {
    case getArtistData(artistId: Int)
    case getArtistChartData(artistId: Int)
}

extension ArtistServiceType: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Config.baseURL) else {
            preconditionFailure("유효하지 않는 base URL: \(Config.baseURL)")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getArtistData(let artistId):
            return "/v1/api/artists/\(artistId)"
        case .getArtistChartData(let artistId):
            return "/v1/api/artists/\(artistId)/songs/popular"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getArtistData:
            return .get
        case .getArtistChartData:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getArtistData:
            return .requestPlain
        case .getArtistChartData:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
