//
//  ArtistTabbarCell.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/20/24.
//

import UIKit

import SnapKit
import Then

final class ArtistTabbarCell: UICollectionViewCell {
    
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? .white : .spotifyGray30
        }
    }
    
    func setStyle() {
        titleLabel.do {
            $0.textColor = .spotifyGray30
            $0.font = .font(.regular_kr3)
        }
    }
    
    func setHierarchy() {
        contentView.addSubviews(titleLabel)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

extension ArtistTabbarCell {
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
