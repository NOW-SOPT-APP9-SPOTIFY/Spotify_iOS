//
//  RecommendSeviceType.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/23/24.
//

import Foundation
import Moya

enum RecommendServiceType {
    case fetchRecommendDatas
}

extension RecommendServiceType: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Config.baseURL) else {
            preconditionFailure("유효하지 않는 base URL: \(Config.baseURL)")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .fetchRecommendDatas:
            return "/v1/api/members/me/albums/recommend"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchRecommendDatas:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchRecommendDatas:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
