//
//  ArtistMusicView.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/20/24.
//

import UIKit

import SnapKit

enum Section: String, CaseIterable {
    case popularity = "인기"
    case artistRecommendation = "아티스트 추천"
//    case popularMusic = "인기 음악"
//    case genre = "Bruno Mars 장르"
//    case detail = "상세정보"
//    case playlist = "아티스트 플레이리스트"
//    case otherFanFavorites = "팬들이 좋아하는 다른 음악"
//    case includedWorks = "수록된 작품"
}

final class ArtistMusicView: UIView {

    // MARK: - UI Components
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: setSectionLayout())
        
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension ArtistMusicView {
    
    func setStyle() {
        collectionView.do {
            $0.isScrollEnabled = false
            $0.backgroundColor = .clear
//            $0.contentInsetAdjustmentBehavior = .never
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    func setHierarchy() {
        self.addSubviews(collectionView)
    }
    
    func setLayout() {
        collectionView.snp.makeConstraints {
            $0.height.equalTo(705).priority(.low)
            $0.edges.equalToSuperview()
        }
        collectionView.setContentHuggingPriority(.required, for: .vertical)
    }
}

private extension ArtistMusicView {
    
    func setInterSectionSpacing(_ layout: UICollectionViewCompositionalLayout) {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 24
        layout.configuration = config
    }
    
    func setSectionLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment -> NSCollectionLayoutSection in
            let sectionType = Section.allCases[sectionIndex]
            switch sectionType {
            case .popularity:
                return self.popularitySectionLayout()
            case .artistRecommendation:
                return self.artistRecommendationSectionLayout()
//            case .popularMusic:
//                return self.getLiveChannelSectionLayout(sectionType: sectionType)
//            case .genre:
//                return self.getImageBannerSectionLayout(sectionType: sectionType)
            }
        }
        setInterSectionSpacing(layout)
        return layout
    }
    
    func popularitySectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(62)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        let header = getSectionHeader()
        section.contentInsets = .init(top: 8, leading: 0, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = [header]
        
        return section
    }

    func artistRecommendationSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(252)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        let header = getSectionHeader()
        section.contentInsets = .init(top: 8, leading: 16, bottom: 0, trailing: 16)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
//    func getLiveChannelSectionLayout(sectionType: Section) -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1),
//            heightDimension: .fractionalHeight(1)
//        )
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        
//        let groupSize = NSCollectionLayoutSize(
//            widthDimension: .absolute(160),
//            heightDimension: .absolute(138)
//        )
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//
//        let section = NSCollectionLayoutSection(group: group)
//        let header = getSectionHeader()
//        section.interGroupSpacing = 7
//        section.boundarySupplementaryItems = [header]
//        section.orthogonalScrollingBehavior = .continuous
//        section.contentInsets = .init(top: 8, leading: 15, bottom: 0, trailing: 0)
//
//        return section
//    }
//    
//    func getImageBannerSectionLayout(sectionType: Section) -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(0.5),
//            heightDimension: .fractionalHeight(1)
//        )
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
//
//        let groupSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1),
//            heightDimension: .absolute(58)
//        )
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//
//        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .continuous
//        section.contentInsets = .init(top: 49-18, leading: 0, bottom: 38, trailing: 0)
//        
//        return section
//    }
    
    func getSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
       let header = NSCollectionLayoutBoundarySupplementaryItem(
           layoutSize: NSCollectionLayoutSize(
               widthDimension: .fractionalWidth(1),
               heightDimension: .estimated(22)
           ),
           elementKind: UICollectionView.elementKindSectionHeader,
           alignment: .topLeading
       )
       return header
    }
    
//    func getSectionFooter() -> NSCollectionLayoutBoundarySupplementaryItem {
//        let footer = NSCollectionLayoutBoundarySupplementaryItem(
//            layoutSize: NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1),
//                heightDimension: .absolute(14)
//            ),
//            elementKind: UICollectionView.elementKindSectionFooter,
//            alignment: .bottomLeading
//        )
//        return footer
//     }
}
