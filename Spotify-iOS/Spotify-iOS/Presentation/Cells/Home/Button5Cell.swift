//
//  Button5Cell.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/17/24.
//

import UIKit

import SnapKit
import Then

final class Button5Cell: UICollectionViewCell {
    
    // MARK: - UIComponents
    
    private let mainImageView = UIImageView().then { $0.backgroundColor = .red }
    private let songTitle = UILabel().then { $0.text = "text 입니다"}
    private let singerTitle = UILabel().then { $0.text = "아일릿"}
    
    private lazy var vStackView = UIStackView(
        arrangedSubviews: [
            mainImageView,
            songTitle,
            singerTitle
        ]
        
    ).then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.setCustomSpacing(8, after: mainImageView)
    }
    
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
        songTitle.do {
            $0.textColor = .white
            $0.font = .font(.regular_en)
        }
        
        singerTitle.do {
            $0.textColor = .spotifyGray30
            $0.font = .font(.regular_kr)
        }
    }
    
    private func setHierarchy() {
        contentView.addSubview(vStackView)
    }
    
    private func setLayout() {
        
        vStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        mainImageView.snp.makeConstraints {
            $0.height.equalTo(142)
        }
        
        songTitle.snp.makeConstraints {
            $0.height.equalTo(15)
        }
    }
    
    // MARK: - Methods
    
    func bindData(data: Song) {
        self.mainImageView.image = UIImage(named: "imgHitCard\(data.id)")
        self.songTitle.text = data.title
        self.singerTitle.text = data.artist
    }
}
