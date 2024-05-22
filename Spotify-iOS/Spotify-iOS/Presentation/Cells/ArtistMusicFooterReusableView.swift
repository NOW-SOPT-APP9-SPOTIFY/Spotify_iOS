//
//  ArtistMusicFooterReusableView.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/23/24.
//

import UIKit

import SnapKit
import Then

final class ArtistMusicFooterReusableView: UICollectionReusableView {
    
    private var button = RoundBorderCustomButton(
        title: "",
        font: .regular_kr,
        verticalPadding: 5.5,
        horizontalPadding: 17,
        cornerRadius: 13
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy() {
        self.addSubview(button)
    }
    
    private func setLayout() {
        button.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(8)
            $0.centerX.equalToSuperview()
        }
    }
}

extension ArtistMusicFooterReusableView {
    
    func configure(title: String) {
        button.title = title
    }
}
