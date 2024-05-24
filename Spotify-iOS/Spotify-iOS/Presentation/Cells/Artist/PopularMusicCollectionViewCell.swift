//
//  PopularMusicCollectionViewCell.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/22/24.
//

import UIKit

import SnapKit
import Then

final class PopularMusicCollectionViewCell: UICollectionViewCell {
    
    private let albumImageView = UIImageView()
    private let stackView = UIStackView()
    private let albumTitleLabel = UILabel()
    private let yearOfReleaseLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        albumImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.backgroundColor = .spotifyGray40
        }
        
        stackView.do {
            $0.spacing = 3
            $0.axis = .vertical
        }
        
        albumTitleLabel.do {
            $0.text = "Unorthodox Jukebox"
            $0.textColor = .white
            $0.font = .font(.h3_en_bold)
        }
        
        yearOfReleaseLabel.do {
            $0.text = "2012 · 앨범"
            $0.textColor = .spotifyGray30
            $0.font = .systemFont(ofSize: 11, weight: .medium)
        }
    }
    
    private func setHierarchy() {
        contentView.addSubviews(
            albumImageView,
            stackView
        )
        [albumTitleLabel, yearOfReleaseLabel].forEach { stackView.addArrangedSubview($0) }
    }
    
    private func setLayout() {
        albumImageView.snp.makeConstraints {
            $0.size.equalTo(77)
            $0.leading.equalToSuperview().inset(16)
            $0.verticalEdges.equalToSuperview().inset(8)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(albumImageView.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()
        }
    }
}

extension PopularMusicCollectionViewCell {
    
    func configure() {
    }
}
