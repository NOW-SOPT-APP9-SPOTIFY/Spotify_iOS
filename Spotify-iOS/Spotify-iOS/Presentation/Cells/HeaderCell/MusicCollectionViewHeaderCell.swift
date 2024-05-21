//
//  MusicCollectionViewHeaderCell.swift
//  Spotify-iOS
//
//  Created by 김민성 on 5/18/24.
//

import UIKit

import SnapKit
import Then

final class MusicCollectionViewHeaderCell: UICollectionViewCell {
    private let artistImage = UIImageView()
    private let artistName = UILabel()
    private let subText = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MusicCollectionViewHeaderCell {
    func setUI() {
        artistImage.do {
            $0.image = UIImage(resource: .imgProfile)
        }
        
        artistName.do {
            $0.text = "Taylor Swift"
            $0.font = UIFont(name: PretendardType.B.rawValue, size: 11)
            $0.textAlignment = .left
            $0.textColor = .spotifyGray20
        }
        
        subText.do {
            $0.text = "과(와) 비슷한 아티스트 찾기"
            $0.font = UIFont(name: PretendardType.R.rawValue, size: 11)
            $0.textAlignment = .left
            $0.textColor = .spotifyGray20
        }
    }
    
    func setHierarchy() {
        addSubviews(
            artistImage,
            artistName,
            subText
        )
    }
    
    func setLayout() {
        artistImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.height.width.equalTo(23)
        }
        
        artistName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.leading.equalTo(artistImage.snp.trailing).offset(8)
            $0.height.equalTo(15)
        }
        
        subText.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.leading.equalTo(artistName.snp.trailing)
            $0.height.equalTo(15)

        }

    }
    
    func bindTitle(musicianName: String) {
        self.artistName.text = musicianName
    }
}
