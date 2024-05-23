//
//  MusicRecommendView.swift
//  Spotify-iOS
//
//  Created by 김민성 on 5/13/24.
//

import UIKit

import SnapKit
import Then

class MusicRecommendView: UIView {
    
    // MARK: - UI Components
    
        lazy var musicRecommendationCollectionView: UICollectionView = {
        let layout = makeCompositionalLayout()
        let musicRecommendationCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        musicRecommendationCollectionView.isScrollEnabled = true
        musicRecommendationCollectionView.backgroundColor = .clear
        musicRecommendationCollectionView.showsVerticalScrollIndicator = false
    
        return musicRecommendationCollectionView
    }()
    
    private let profileImageView = UIImageView()
    private let tasteChipButton = UIButton()
    let removeButton = UIButton()
    
    private lazy var hStackView = UIStackView(
        arrangedSubviews: [
            profileImageView,
            removeButton,
            tasteChipButton
        ]
    )
    
    // (UIComponents) CustumView 상단에 프로필하고 메뉴 뜨는거 추가 하면 됨
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        backgroundColor = .black
        
        profileImageView.do {
            $0.image = .imgProfile
        }
        
        tasteChipButton.do {
            $0.setImage(.imgChipsTasteOn, for: .normal)
        }
        
        removeButton.do {
            $0.setImage(.imgChipsX, for: .normal)
        }
        
        hStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.distribution = .fill
        }
    }
    
    func setHierarchy() {
        addSubviews(hStackView, musicRecommendationCollectionView)
    }
    
    func setLayout() {
        
        hStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(9)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(16)
            $0.height.equalTo(28)
        }
        
        musicRecommendationCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }
}

// MARK: - Extensions

extension MusicRecommendView {
    func makeCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(500))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(23))
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
