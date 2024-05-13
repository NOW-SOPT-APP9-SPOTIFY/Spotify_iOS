//
//  RecommandView.swift
//  Spotify-iOS
//
//  Created by 김민성 on 5/13/24.
//

import UIKit

import SnapKit
import Then

class MusicRecommandView: UIView {
    
    // MARK: - UI Components
    
//    private lazy var musicRecommendationCollectionView: UICollectionView = {
//        let layout = makeCompositionalLayout()
//        let musicRecommendationCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        
//        musicRecommendationCollectionView.isScrollEnabled = true
//        musicRecommendationCollectionView.backgroundColor = .clear
//        musicRecommendationCollectionView.showsVerticalScrollIndicator = false
//        
//        return musicRecommendationCollectionView
//    }()
    
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
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {
        
    }
    
}

// MARK: - Extensions

//extension MusicRecommandView {
//    func makeCompositionalLayout() -> UICollectionViewCompositionalLayout {
//        
//    }
//}
