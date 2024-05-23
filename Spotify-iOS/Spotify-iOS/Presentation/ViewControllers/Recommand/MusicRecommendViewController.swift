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
    
    let headerTitle: [String] = ["Taylor Swift"]
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
        addTarget()
        setRegister()
        setDelegate()
    }
    
//    func setLayout() {
        
//    }
    
    func addTarget() {
        musicRecommendView.removeButton.addTarget(self, action: #selector(chipButtonDidTap), for: .touchUpInside)
        
        navigationItem.hidesBackButton = true
    }
    
    func setRegister() {
        musicRecommendView.musicRecommendationCollectionView.register(
            MusicCollectionViewHeaderCell.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: MusicCollectionViewHeaderCell.className
        )
        musicRecommendView.musicRecommendationCollectionView.register(
            MusicItemCollectionViewCell.self,
            forCellWithReuseIdentifier: MusicItemCollectionViewCell.className
        )
    }
    
    func setDelegate() {
        musicRecommendView.musicRecommendationCollectionView.delegate = self
        musicRecommendView.musicRecommendationCollectionView.dataSource = self
    }
    
    @objc 
    func chipButtonDidTap() {
        if let navigationController = self.navigationController {
            let homeViewController = HomeViewController()
            var viewControllers = navigationController.viewControllers
            viewControllers.removeLast()
            viewControllers.append(homeViewController)
            navigationController.setViewControllers(viewControllers, animated: false)
        }
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicItemCollectionViewCell.className, for: indexPath) as?
                MusicItemCollectionViewCell else { return UICollectionViewCell()}
        let model = testList[indexPath.row]
        cell.bindData(testModel(musicTitle: model.musicTitle, albumName: model.albumName, musicianName: model.musicianName, albumInfo: model.albumInfo))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MusicCollectionViewHeaderCell.className, for: indexPath) as? MusicCollectionViewHeaderCell else { return UICollectionReusableView() }
        headerView.bindTitle(musicianName: headerTitle[0])
        return headerView
    }
}
