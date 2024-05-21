//
//  PopularityCollectionViewCell.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/22/24.
//

import UIKit

import SnapKit
import Then

final class PopularityCollectionViewCell: UICollectionViewCell {
    
    private let rankingLabel = UILabel()
    private let albumImageView = UIImageView()
    private let titleLabel = UILabel()
    private let numberOfPlaysLabel = UILabel()
    private let nineteenPlusButton = UIButton()
    private let moreButton = UIButton()
    
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
        rankingLabel.do {
            $0.textColor = .white
            $0.font = .font(.regular_en_bold)
        }
        
        albumImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.backgroundColor = .spotifyGray40
        }
        
        titleLabel.do {
            $0.textColor = .white
            $0.font = .font(.medium_en2)
        }
        
        numberOfPlaysLabel.do {
            $0.textColor = .spotifyGray30
            $0.font = .font(.regular_en)
        }
        
        nineteenPlusButton.do {
            $0.setImage(.ic19, for: .normal)
        }
        
        moreButton.do {
            $0.setImage(.icEllipsisGray, for: .normal)
        }
    }
    
    private func setHierarchy() {
        contentView.addSubviews(
            rankingLabel,
            albumImageView,
            titleLabel,
            numberOfPlaysLabel,
            nineteenPlusButton,
            moreButton
        )
    }
    
    private func setLayout() {
        rankingLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        
        albumImageView.snp.makeConstraints {
            $0.size.equalTo(46)
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(14)
            $0.verticalEdges.equalToSuperview().inset(8)
        }
        
        titleLabel.snp.makeConstraints {
            $0.height.equalTo(17)
            $0.top.equalTo(albumImageView.snp.top).offset(6)
            $0.leading.equalTo(albumImageView.snp.trailing).offset(12)
        }
        
        numberOfPlaysLabel.snp.makeConstraints {
            $0.height.equalTo(14)
            $0.bottom.equalTo(albumImageView.snp.bottom).offset(-6)
        }
        
        moreButton.snp.makeConstraints {
            $0.size.equalTo(44)
            $0.trailing.equalToSuperview().inset(3)
            $0.centerY.equalToSuperview()
        }
    }
}

extension PopularityCollectionViewCell {
    
    func configure(
        ranking: Int,
        albumImg: UIImage,
        title: String, 
        numberOfPlays: String,
        is19Plus: Bool
    ) {
        rankingLabel.text = "\(ranking)"
        albumImageView.image = albumImg
        titleLabel.text = title
        numberOfPlaysLabel.text = numberOfPlays
        numberOfPlaysLabel.snp.makeConstraints {
            $0.leading.equalTo(is19Plus ? nineteenPlusButton.snp.trailing : titleLabel)
        }
        
        if is19Plus {
            nineteenPlusButton.snp.makeConstraints {
                $0.size.equalTo(16)
                $0.leading.equalTo(titleLabel)
                $0.bottom.equalTo(numberOfPlaysLabel)
            }
        }
    }
}
