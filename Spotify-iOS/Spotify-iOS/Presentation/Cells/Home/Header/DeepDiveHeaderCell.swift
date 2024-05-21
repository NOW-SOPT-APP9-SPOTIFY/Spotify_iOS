//
//  DeepDiveHeaderCell.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/21/24.
//

import UIKit

import SnapKit
import Then

final class DeepDiveHeaderCell: UICollectionViewCell {
    
    // MARK: - UIComponents
    
    private let titleImageView = UIImageView()
    private let headerSubLabel = UILabel()
    private let headerMainLabel = UILabel()
    
    private lazy var LabelVStackView =  UIStackView(
        arrangedSubviews: [
            headerSubLabel,
            headerMainLabel
        ]
    )
    
    private lazy var mainHStackView = UIStackView(
        arrangedSubviews: [
            titleImageView,
            LabelVStackView
        ]
    )
    
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
    
    // MARK: - UI & Layout
    
    private func setUI() {
        
        titleImageView.do {
            $0.image = .imgDeepDive1
        }
        
        headerSubLabel.do {
            $0.font = .font(.regular_kr)
            $0.textColor = .spotifyGray30
            $0.text = "더 파고들기"
        }
        
        headerMainLabel.do {
            $0.font = .font(.h1_kr_bold)
            $0.textColor = .white
            $0.text = "Red Hot Chili Peppers"
        }
        
        LabelVStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
        }
        
        mainHStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
        }
        
    }
    
    private func setHierarchy() {
        contentView.addSubview(mainHStackView)
    }
    
    private func setLayout() {
        
        titleImageView.snp.makeConstraints {
            $0.width.height.equalTo(46)
        }
        
        mainHStackView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(24.5)
            $0.leading.equalTo(contentView.snp.leading)
        }
    }
}
