//
//  HomeView.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/11/24.
//

import UIKit

import SnapKit
import Then

final class HomeView: UIView {
    
    // MARK: - UIComponents
    
    private let profileImageView = UIImageView()
    
    let tasteChipButton = UIButton()
    private let popCastChipButton = UIButton()
    let likeChipButton = UIButton()
    
    private lazy var hStackView = UIStackView(
        arrangedSubviews: [
            profileImageView,
            tasteChipButton,
            popCastChipButton,
            likeChipButton
        ]
    )
    
    lazy var homeCollectionView: UICollectionView = {
        let layout = CompositionalLayout.createSpotifyMainHomeLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .spotifyBg
        collectionView.isScrollEnabled = true
        return collectionView
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        backgroundColor = .spotifyBg
        
        profileImageView.do {
            $0.image = .imgProfile
        }
        
        tasteChipButton.do {
            $0.setImage(.imgChipsTaste, for: .normal)
        }
        
        popCastChipButton.do {
            $0.setImage(.imgChipsMusic, for: .normal)
        }
        
        likeChipButton.do {
            $0.setImage(.imgChipsLike, for: .normal)
        }
        
        hStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.distribution = .fill
        }
    }
    
    private func setHierarchy() {
        addSubviews(
            hStackView,
            homeCollectionView
        )
    }
    
    private func setLayout() {
        hStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(9)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(16)
            $0.height.equalTo(28)
        }
        
        homeCollectionView.snp.makeConstraints {
            $0.top.equalTo(hStackView.snp.bottom)
            $0.leading.equalTo(safeAreaLayoutGuide).inset(16)
            $0.trailing.equalTo(safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
}

struct SpotifyButtonHandler {
    static let handler: UIButton.ConfigurationUpdateHandler = { button in
        switch button.state {
        case [.selected, .highlighted]:
            button.configuration?.baseForegroundColor = .green
        default:
            button.configuration?.title = "Normal"
        }
    }
}
