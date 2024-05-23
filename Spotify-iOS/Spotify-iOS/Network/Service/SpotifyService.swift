//
//  SpotifyService.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/22/24.
//

import Foundation

import Moya

final class SpotifyService {
    static let shared = SpotifyService()
    private var homeProvider = MoyaProvider<HomeServiceType>(plugins: [MoyaLoggingPlugin()])
    private var recommendProvider = MoyaProvider<RecommendServiceType>(plugins: [MoyaLoggingPlugin()])
    private var artistsProvider = MoyaProvider<ArtistServiceType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension SpotifyService {
    func fetchOneSectionDatas(completion: @escaping (NetworkResult<Any>) -> Void) {
        homeProvider.request(.fetchOneSectionDatas) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, BaseResponse<PlaylistsDTO>.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func fetchTwoSectionDatas(completion: @escaping (NetworkResult<Any>) -> Void) {
        homeProvider.request(.fetchTwoSectionDatas) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, BaseResponse<SongsDTO>.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func fetchThreeSectionDatas(completion: @escaping (NetworkResult<Any>) -> Void) {
        homeProvider.request(.fetchThreeSectionDatas) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, ArtistsDTO.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    public func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200..<205:
            return isValidData(data: data, T.self)
        case 400..<500:
            return .requestErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func isValidData<T: Codable>(data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            print("⛔️ \(self) 애서 디코딩 오류가 발생했습니다")
            return .pathErr
        }
        
        return .success(decodedData as Any)
    }
}

// MARK: - Extensions

extension SpotifyService {
    func fetchRecommendDatas(completion: @escaping (NetworkResult<Any>) -> Void) {
        recommendProvider.request(.fetchRecommendDatas) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, RecommendModel.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
