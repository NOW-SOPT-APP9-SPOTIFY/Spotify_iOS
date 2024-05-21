//
//  ArtistRecommendationCollectionViewCell.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/22/24.
//

import UIKit

import SnapKit
import Then

final class ArtistRecommendationCollectionViewCell: UICollectionViewCell {
    
    private let artistImageView = UIImageView()
    private let sharerLabel = UILabel()
    private let playlistImageView = UIImageView()
    private let stackView = UIStackView()
    private let titleOfSong = UILabel()
    private let playlistLabel = UILabel()
    private var nextButton = UIButton()
    private let backgroundImageView = UIImageView()
    
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
        artistImageView.do {
            $0.backgroundColor = .spotifyGray40
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 12
            $0.clipsToBounds = true
        }
        
        sharerLabel.do {
            $0.text = "공유한 사람 : Bruno Mars"
            $0.textColor = .white
            $0.font = .font(.regular_kr)
        }
        
        playlistImageView.do {
            $0.backgroundColor = .spotifyGray40
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        stackView.do {
            $0.spacing = 6
            $0.axis = .vertical
        }
        
        titleOfSong.do {
            $0.text = "Bruno Mars - An Evening With Sil ..."
            $0.textColor = .white
            $0.font = .font(.medium_en3)
        }
        
        playlistLabel.do {
            $0.text = "플레이리스트"
            $0.textColor = .spotifyGray10
            $0.font = .font(.regular_kr)
        }
        
        nextButton.do {
            $0.setImage(.icNextWhite, for: .normal)
        }
        
        backgroundImageView.do {
            $0.image = .imgArtistExample
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
    }
    
    private func setHierarchy() {
        contentView.addSubviews(
            backgroundImageView,
            artistImageView,
            sharerLabel,
            playlistImageView,
            stackView,
            nextButton
        )
        [titleOfSong, playlistLabel].forEach { stackView.addArrangedSubview($0) }
    }
    
    private func setLayout() {
        artistImageView.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.top.leading.equalToSuperview().inset(16)
        }
        
        sharerLabel.snp.makeConstraints {
            $0.leading.equalTo(artistImageView.snp.trailing).offset(8)
            $0.centerY.equalTo(artistImageView)
        }
        
        playlistImageView.snp.makeConstraints {
            $0.size.equalTo(53)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(14)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(playlistImageView.snp.trailing).offset(13)
            $0.centerY.equalTo(playlistImageView)
        }
        
        nextButton.snp.makeConstraints {
            $0.size.equalTo(44)
            $0.trailing.equalToSuperview().inset(1)
            $0.centerY.equalTo(playlistImageView)
        }
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ArtistRecommendationCollectionViewCell {
    
    func configure() {
        
    }
}
