//
//  HomeViewController.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/11/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - UIComponents
    
    private let rootView = HomeView()
    
    private let dummyImages: [UIImage] = [UIImage(resource: .imgCard4), UIImage(resource: .imgCard3), UIImage(resource: .imgCard2), UIImage(resource: .imgCard1)]
    private let dummmyText: [String] = ["LE SSERAFIM,  ILLIT, (여자) 아이들, BABY MONSTER,...", "LE SSERAFIM,  ILLIT, (여자) 아이들, BABY MONSTER,...", "이명진 신곡", "asdsadasdasdasdasdasds"]
    
    private let sectionTwoDummyData: [HitSongModel] = HomeMockingModel.getRecommendData()
    private let sectionArtistDummyData: [ArtistModel] = HomeMockingModel.getAristData()
    private let sectionRecentlyDummyData: [RecentlyModel] = HomeMockingModel.getRecentlyData()
    private let sectionShowDummyData: [ShowModel] = HomeMockingModel.getShowData()
    private let sectionRadioDummyData: [RadioModel] = HomeMockingModel.getRadioData()
    private let sectionDeepDiveDummyData: [RadioModel] = HomeMockingModel.getDeepDiveData()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .spotifyBg
        setAddTarget()
        setDelegate()
        setRegister()
    }
    
    override func loadView() {
        self.view = rootView
    }
    
    // MARK: - Methods
    
    func setAddTarget() {
        rootView.tasteChipButton.addTarget(self, action: #selector(chipButtonDidTap), for: .touchUpInside)
    }
    
    private func setDelegate() {
        rootView.homeCollectionView.delegate = self
        rootView.homeCollectionView.dataSource = self
    }
    
    private func setRegister() {
        rootView.homeCollectionView.register(CardMixCell.self, forCellWithReuseIdentifier: CardMixCell.className)
        rootView.homeCollectionView.register(Button5Cell.self, forCellWithReuseIdentifier: Button5Cell.className)
        rootView.homeCollectionView.register(Button1Cell.self, forCellWithReuseIdentifier: Button1Cell.className)
        rootView.homeCollectionView.register(Button4Cell.self, forCellWithReuseIdentifier: Button4Cell.className)
        rootView.homeCollectionView.register(Button3Cell.self, forCellWithReuseIdentifier: Button3Cell.className)
        rootView.homeCollectionView.register(Button2KrCell.self, forCellWithReuseIdentifier: Button2KrCell.className)
        
        rootView.homeCollectionView.register(HomeViewHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeViewHeaderCell.className)
        rootView.homeCollectionView.register(DeepDiveHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DeepDiveHeaderCell.className)
    }
    
    private func headerTitle(for section: CompositionalLayout.HomeSection) -> String {
        switch section {
        case .recommend:
            return "나만을 위한 추천"
        case .hitSong:
            return "오늘의 최고 히트곡"
        case .artist:
            return "인기 아티스트"
        case .recently:
            return "최근 재생한 항목"
        case .show:
            return "들어볼만한 Show"
        case .radio:
            return "인기 라디오"
        case .specific:
            return ""
        }
    }
    
    // MARK: - Objc Func
    
    @objc func chipButtonDidTap() {
        if let navigationController = self.navigationController {
            let cardViewController = CardViewController()
            var viewControllers = navigationController.viewControllers
            viewControllers.removeLast()
            viewControllers.append(cardViewController)
            navigationController.setViewControllers(viewControllers, animated: false) // 루트 뷰로 바꿔주는 작업
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return CompositionalLayout.HomeSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = CompositionalLayout.HomeSection(rawValue: section) else {
            return 0
        }
        
        switch sectionType {
        case .recommend:
            return dummyImages.count
        case .hitSong:
            return sectionTwoDummyData.count
        case .artist:
            return sectionArtistDummyData.count
        case .recently:
            return sectionRecentlyDummyData.count
        case .show:
            return sectionShowDummyData.count
        case .radio:
            return sectionRadioDummyData.count
        case .specific:
            return sectionDeepDiveDummyData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = CompositionalLayout.HomeSection(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        
        switch sectionType {
        case .recommend:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardMixCell.className, for: indexPath) as? CardMixCell else { return UICollectionViewCell() }
            cell.bindData(image: dummyImages[indexPath.row])
            cell.bindTitle(text: dummmyText[indexPath.row])
            return cell
        case .hitSong:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Button5Cell.className, for: indexPath) as? Button5Cell else { return UICollectionViewCell() }
            cell.bindData(data: sectionTwoDummyData[indexPath.row])
            return cell
        case .artist:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Button1Cell.className, for: indexPath) as? Button1Cell else { return UICollectionViewCell() }
            cell.bindData(data: sectionArtistDummyData[indexPath.row])
            return cell
        case .recently:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Button4Cell.className, for: indexPath) as? Button4Cell else { return UICollectionViewCell() }
            cell.bindData(data: sectionRecentlyDummyData[indexPath.row])
            return cell
        case .show:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Button3Cell.className, for: indexPath) as? Button3Cell else { return UICollectionViewCell() }
            cell.bindData(data: sectionShowDummyData[indexPath.row])
            return cell
        case .radio:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Button2KrCell.className, for: indexPath) as? Button2KrCell else { return UICollectionViewCell() }
            cell.bindData(data: sectionRadioDummyData[indexPath.row])
            return cell
        case .specific:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Button2KrCell.className, for: indexPath) as? Button2KrCell else { return UICollectionViewCell() }
            cell.bindData(data: sectionDeepDiveDummyData[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        if let sectionType = CompositionalLayout.HomeSection(rawValue: indexPath.section) {
            switch sectionType {
            case .specific:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DeepDiveHeaderCell.className, for: indexPath) as? DeepDiveHeaderCell else {
                    return UICollectionReusableView()
                }
                return headerView
            default:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeViewHeaderCell.className, for: indexPath) as? HomeViewHeaderCell else {
                    return UICollectionReusableView()
                }
                headerView.bindData(text: headerTitle(for: sectionType))
                return headerView
            }
        }
        
        return UICollectionReusableView()
    }

}
