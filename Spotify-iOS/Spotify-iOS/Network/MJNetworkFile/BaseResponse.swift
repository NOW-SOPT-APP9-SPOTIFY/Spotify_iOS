//
//  BaseResponse.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/22/24.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    let status: Int
    let message: String
    let data: T?
}
