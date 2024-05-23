//
//  HomeMockingModel.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/20/24.
//

import UIKit

struct PlaylistsDTO: Codable {
    let playlists: [Playlist]
}

struct Playlist: Codable {
    let id: Int
    let playlistName: String
    let artists: [String]
}

struct HitSongModel {
    let image: UIImage
    let title: String
    let singer: String
}

struct ArtistModel {
    let image: UIImage
    let title: String
}

struct RecentlyModel {
    let image: UIImage
    let title: String
}

struct ShowModel {
    let image: UIImage
    let genre: String
    let mcName: String
    let title: String
}

struct RadioModel {
    let image: UIImage
    let title: String
}

struct DeepDiveModel {
    let image: UIImage
    let title: String
}

struct HomeMockingModel {
    
    static func getRecommendData() -> [HitSongModel] {
        
        let dummyModel = [
            HitSongModel(image: .imgHitCard1, title: "Magnatic", singer: "ILLIT"),
            HitSongModel(image: .imgHitCard2, title: "Perfect", singer: "Ed Sheeran"),
            HitSongModel(image: .imgHitCard3, title: "Perfect", singer: "Ed Sheeran"),
            HitSongModel(image: .imgHitCard3, title: "Perfect", singer: "Ed Sheeran")
        ]
        
        return dummyModel
    }
    
    static func getAristData() -> [ArtistModel] {
        
        let dummyModel = [ArtistModel(image: .imgArtist1, title: "ILLIT"),
                          ArtistModel(image: .imgArtist2, title: "RIZE"),
                          ArtistModel(image: .imgArtist3, title: "백예린"),
                          ArtistModel(image: .imgArtist3, title: "백예린")]
        
        return dummyModel
    }
    
    static func getRecentlyData() -> [RecentlyModel] {
        
        let dummyModel = [RecentlyModel(image: .imgRecently1, title: "ILLIT"),
                          RecentlyModel(image: .imgRecently2, title: "RIZE"),
                          RecentlyModel(image: .imgRecently3, title: "백예린"),
                          RecentlyModel(image: .imgRecently4, title: "백예린")]
        
        return dummyModel
    }
    
    static func getShowData() -> [ShowModel] {
        
        let dummyModel = [
            ShowModel(image: .imgShow1, genre: "사회 및 문화", mcName: "Podcast Malam Kliwon", title: "프로그램 • Podkesmas Asia"),
            ShowModel(image: .imgShow2, genre: "비지니스", mcName: "The Game w/ Alex Horm", title: "프로그램 • Alex Hormozi"),
            ShowModel(image: .imgShow3, genre: "사회 및 문화", mcName: "Podcast Malam Kliwon", title: "프로그램 • Podkesmas Asia"),
            ShowModel(image: .imgShow4, genre: "사회 및 문화", mcName: "Podcast Malam Kliwon", title: "프로그램 • Podkesmas Asia")
        ]
        
        return dummyModel
    }
    
    static func getRadioData() -> [RadioModel] {
        
        let dummyModel = [
            RadioModel(image: .imgRadio1, title: "Ariana Grande,LESSERAFIM,NewJeans, T..."),
            RadioModel(image: .imgRadio2, title: "Ariana Grande,LESSERAFIM,NewJeans, T..."),
            RadioModel(image: .imgRadio3, title: "Ariana Grande,LESSERAFIM,NewJeans, T..."),
            RadioModel(image: .imgRadio4, title: "Ariana Grande,LESSERAFIM,NewJeans, T...")
        ]
        
        return dummyModel
    }
    
    static func getDeepDiveData() -> [RadioModel] {
        
        let dummyModel = [
            RadioModel(image: .imgDeepDive2, title: "AC/DC, Red Hot ChiliPerppers, TheCran berries.."),
            RadioModel(image: .imgDeepDive3, title: "AC/DC, Red Hot ChiliPerppers, TheCran berries.."),
            RadioModel(image: .imgDeepDive4, title: "AC/DC, Red Hot ChiliPerppers, TheCran berries.."),
            RadioModel(image: .imgDeepDive5, title: "AC/DC, Red Hot ChiliPerppers, TheCran berries..")
        ]
        
        return dummyModel
    }
}
