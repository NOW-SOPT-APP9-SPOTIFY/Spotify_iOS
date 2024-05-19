//
//  ArtistHeaderView.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/18/24.
//

import UIKit

import SnapKit
import Then

final class ArtistHeaderView: UIView {
    
    // MARK: - UI Components
    
    private let artistImageView = UIImageView()
    private let gradientView = UIView()
    private let monthlyListenerLabel = UILabel()
    private let shortsButton = UIButton()
    private let followButton = RoundBorderCustomButton(
        title: "팔로우하기",
        verticalPadding: 8.5,
        horizontalPadding: 16
    )
    private let moreButton = UIButton()
    private let shuffleButton = UIButton()
    private let playButton = UIButton()
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setGradient()
    }
}

// MARK: - Extensions

private extension ArtistHeaderView {
    
    func setStyle() {
        artistImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.image = .imgBrunoMars
            $0.clipsToBounds = true
        }
        
        monthlyListenerLabel.do {
            $0.text = "월별 청취자 1280.9만명"
            $0.textColor = .spotifyGray30
            $0.font = .font(.medium_kr)
        }
        
        shortsButton.do {
            $0.setImage(.imgShorts, for: .normal)
        }
        
        moreButton.do {
            $0.setImage(.icEllipsisGray, for: .normal)
        }
        
        shuffleButton.do {
            $0.setImage(.icShuffle, for: .normal)
        }
        
        playButton.do {
            $0.setImage(.icPlayGreen, for: .normal)
        }
    }
    
    func setHierarchy() {
        self.addSubviews(
            artistImageView,
            gradientView,
            monthlyListenerLabel,
            shortsButton,
            followButton,
            moreButton,
            shuffleButton,
            playButton
        )
    }
    
    func setLayout() {
        artistImageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
        }
        
        gradientView.snp.makeConstraints {
            $0.top.equalTo(artistImageView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(monthlyListenerLabel.snp.bottom)
        }
        
        monthlyListenerLabel.snp.makeConstraints {
            $0.top.equalTo(artistImageView.snp.bottom).offset(18)
            $0.leading.equalToSuperview().inset(16)
        }
        
        shortsButton.snp.makeConstraints {
            $0.top.equalTo(monthlyListenerLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(16)
        }
        
        followButton.snp.makeConstraints {
            $0.leading.equalTo(shortsButton.snp.trailing).offset(23)
            $0.centerY.equalTo(shortsButton)
        }
        
        moreButton.snp.makeConstraints {
            $0.size.equalTo(44)
            $0.leading.equalTo(followButton.snp.trailing).offset(8)
            $0.bottom.equalTo(shortsButton.snp.bottom)
        }
        
        shuffleButton.snp.makeConstraints {
            $0.size.equalTo(44)
            $0.trailing.equalTo(playButton.snp.leading).offset(-8)
            $0.centerY.equalTo(playButton)
        }
        
        playButton.snp.makeConstraints {
            $0.top.equalTo(monthlyListenerLabel.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
    
    func setGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.colors = [
            CGColor.init(red: 49/255, green: 32/255, blue: 25/255, alpha: 1),
            CGColor.init(red: 18/255, green: 18/255, blue: 18/255, alpha: 0.3)
        ]
        gradientView.layer.addSublayer(gradientLayer)
    }
}
