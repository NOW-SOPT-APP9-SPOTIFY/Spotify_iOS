//
//  CompositionalLayout.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/15/24.
//

import UIKit

struct CompositionalLayout {
    
    enum HomeSection: Int, CaseIterable {
        case recommend = 0
        case hitSong
        case artist
        case recently
        case show
        case radio
        case specific
        
        var itemWidth: NSCollectionLayoutDimension {
            switch self {
            case .recommend, .hitSong, .artist, .show, .radio, .specific:
                return .fractionalWidth(0.5)
            case .recently:
                return .fractionalWidth(1/3)
            }
        }
        
        var groupWidth: NSCollectionLayoutDimension {
            switch self {
            case .recommend, .show, .radio, .specific:
                return .fractionalWidth(0.9)
            case .hitSong, .artist:
                return .fractionalWidth(0.85)
            case .recently:
                return .fractionalWidth(0.9)
            }
        }
        
        var groupHeight: NSCollectionLayoutDimension {
            switch self {
            case .recommend:
                return .absolute(199)
            case .hitSong:
                return .absolute(179)
            case .artist:
                return .absolute(164)
            case .recently:
                return .absolute(127)
            case .show:
                return .absolute(193)
            case .radio, .specific:
                return .absolute(178)
            }
        }
        
        var headerHeight: NSCollectionLayoutDimension {
            switch self {
            case .specific:
                return .absolute(87)
            default:
                return .absolute(67)
            }
        }
    }
    
    static func createSpotifyMainHomeLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
            
            guard let sectionType = HomeSection(rawValue: sectionNumber) else {
                return nil
            }
            
            return createSection(for: sectionType)
        }
    }
    
    private static func createSection(for section: HomeSection) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: section.itemWidth,
                heightDimension: .fractionalHeight(1)
            )
        )
        item.contentInsets.trailing = 16
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: section.groupWidth, heightDimension: section.groupHeight),
            subitems: [item]
        )
        
        let layoutSection = NSCollectionLayoutSection(group: group)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: section.headerHeight
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        layoutSection.boundarySupplementaryItems = [header]
        
        layoutSection.orthogonalScrollingBehavior = .continuous
        
        if section == .specific {
            layoutSection.contentInsets.bottom = 48
        }
        
        return layoutSection
    }
}
