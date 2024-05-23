//
//  HomeSeviceType.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/22/24.
//

import Foundation
import Moya

enum HomeSeviceType {
    case fetchOneSectionDatas
}

extension HomeSeviceType: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Config.baseURL) else {
            preconditionFailure("유효하지 않는 base URL: \(Config.baseURL)")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .fetchOneSectionDatas:
            return "/v1/api/members/me/playlists/recommend"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchOneSectionDatas:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchOneSectionDatas:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
