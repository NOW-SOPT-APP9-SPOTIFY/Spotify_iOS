//
//  RecommendViewController.swift
//  Spotify-iOS
//
//  Created by 김민성 on 5/14/24.
//

import UIKit

import SnapKit
import Then

struct testModel {
    let musicTitle: String
    let albumName: String
    let musicianName: String
    let albumInfo: String
}

extension testModel {
    static func dummy() -> [testModel] {
        return [
            testModel(musicTitle: "Bruno Mars - Grenade", albumName: "Doo-Wops & Hooligans", musicianName: "앨범 · Bruno Mars", albumInfo: "2010 · 10곡"),
            testModel(musicTitle: "Bruno Mars - Grenade", albumName: "Doo-Wops & Hooligans", musicianName: "앨범 · Bruno Mars", albumInfo: "2010 · 10곡"),
            testModel(musicTitle: "Bruno Mars - Grenade", albumName: "Doo-Wops & Hooligans", musicianName: "앨범 · Bruno Mars", albumInfo: "2010 · 10곡"),
            testModel(musicTitle: "Bruno Mars - Grenade", albumName: "Doo-Wops & Hooligans", musicianName: "앨범 · Bruno Mars", albumInfo: "2010 · 10곡"),
            testModel(musicTitle: "Bruno Mars - Grenade", albumName: "Doo-Wops & Hooligans", musicianName: "앨범 · Bruno Mars", albumInfo: "2010 · 10곡"),
            testModel(musicTitle: "Bruno Mars - Grenade", albumName: "Doo-Wops & Hooligans", musicianName: "앨범 · Bruno Mars", albumInfo: "2010 · 10곡")
        ]
    }
}

class MusicRecommendViewController: UIViewController, UICollectionViewDelegate {
    
    // MARK: - Properties
    
    let identifier = MusicItemCollectionViewCell.className
    let headerTitle: [String: String] = ["musicionName": "Taylor", "headerText": "과(와) 비슷한 아티스트 더 찾기"]
    private let testList = testModel.dummy()
    
    // MARK: - UIComponents
    
    let musicRecommendView = MusicRecommendView()
    let musicProgressBarView = MusicProgressBarView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = musicRecommendView
        
        if let navigationController = self.navigationController {
            navigationController.setNavigationBarHidden(true, animated: false)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicProgressBarView.progress = CGFloat.random(in: 0...1)
        
//        setLayout() // topView 때문에 레이아웃 설정해줘야 할 수도 있어서 남겨놓음
        setRegister()
        setDelegate()
    }
    
//    func setLayout() {
        
//    }
    
    func setRegister() {
        musicRecommendView.musicRecommendationCollectionView.register(MusicItemCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
    }
    
    func setDelegate() {
        musicRecommendView.musicRecommendationCollectionView.delegate = self
        musicRecommendView.musicRecommendationCollectionView.dataSource = self
    }
}

extension MusicRecommendViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    // 데이터가 없기 때문에 일단은 하드코딩으로 처리
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as?
                MusicItemCollectionViewCell else { return UICollectionViewCell()}
        let model = testList[indexPath.row]
        cell.bindData(testModel(musicTitle: model.musicTitle, albumName: model.albumName, musicianName: model.musicianName, albumInfo: model.albumInfo))
        return cell
    }
}
