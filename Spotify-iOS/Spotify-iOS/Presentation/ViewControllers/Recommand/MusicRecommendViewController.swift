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

struct gradientColor {
    let firstColor: CGColor
    let secondColor: CGColor
    let thirdColor: CGColor
}

extension gradientColor {
    static func gradientDummy() -> [gradientColor] {
        return [
            gradientColor(
            firstColor: .init(red: 255/255, green: 185/255, blue: 6/255, alpha: 0.33),
            secondColor: .init(red: 161/255, green: 160/255, blue: 158/255, alpha: 0.14), 
            thirdColor: .init(red: 109/255, green: 109/255, blue: 109/255, alpha: 0.14)),
            
            gradientColor(
            firstColor: .init(red: 255/255, green: 223/255, blue: 161/255, alpha: 0.3),
            secondColor: .init(red: 198/255, green: 183/255, blue: 155/255, alpha: 0.12),
            thirdColor: .init(red: 149/255, green: 149/255, blue: 149/255, alpha: 0.14)),
            
            gradientColor(
            firstColor: .init(red: 169/255, green: 11/255, blue: 11/255, alpha: 1),
            secondColor: .init(red: 91/255, green: 26/255, blue: 26/255, alpha: 0.88),
            thirdColor: .init(red: 35/255, green: 35/255, blue: 35/255, alpha: 1))
        ]
    }
}

class MusicRecommendViewController: UIViewController, UICollectionViewDelegate {
    
    // MARK: - Properties
    
    let headerTitle: [String] = ["Taylor Swift"]
    private let testList = testModel.dummy()
    var albumArray: [Album] = []
    private let gradientList = gradientColor.gradientDummy()
    
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
        fetchAlbumInfo()
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
        return albumArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicItemCollectionViewCell.className, for: indexPath) as?
                MusicItemCollectionViewCell else { return UICollectionViewCell()}
        cell.bindData(albumArray[indexPath.row])
        cell.bindGradient(data: gradientList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MusicCollectionViewHeaderCell.className, for: indexPath) as? MusicCollectionViewHeaderCell else { return UICollectionReusableView() }
        headerView.bindTitle(musicianName: headerTitle[0])
        return headerView
    }
    
}

// MARK: - Extensions

extension MusicRecommendViewController {
    private func fetchAlbumInfo() {
        SpotifyService.shared.fetchRecommendDatas { [weak self] response in
            switch response {
            case .success(let data):
                guard let baseResponse = data as? RecommendModel else {
                    print("데이터를 불러오는 데 실패했습니다.")
                    return
                }
                
                print("🫠🫠\(baseResponse.data)🫠🫠")
                self?.albumArray = baseResponse.data.albums
                DispatchQueue.main.async { // UI 업데이트는 메인 쓰레드에서
                                    self?.musicRecommendView.musicRecommendationCollectionView.reloadData()
                                }
                
            case .requestErr:
                print("요청 오류 입니다")
            case .decodedErr:
                print("디코딩 오류 입니다")
            case .pathErr:
                print("경로 오류 입니다")
            case .serverErr:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }

}
