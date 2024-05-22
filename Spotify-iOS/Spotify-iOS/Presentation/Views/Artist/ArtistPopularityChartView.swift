//
//  ArtistPopularityChartView.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/23/24.
//

import UIKit

import SnapKit
import Then

final class ArtistPopularityChartView: UIView {
    
    // MARK: - UI Components
    
    private let flowLayout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
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

private extension ArtistPopularityChartView {
    
    func setStyle() {
        backgroundColor = .spotifyBg
        
        flowLayout.do {
            $0.scrollDirection = .horizontal
        }
        
        collectionView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    func setHierarchy() {
        self.addSubviews(collectionView)
    }
    
    func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
