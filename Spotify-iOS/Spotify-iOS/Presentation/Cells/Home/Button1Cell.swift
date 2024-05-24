//
//  Button1Cell.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/17/24.
//

import UIKit

import SnapKit
import Then

final class Button1Cell: UICollectionViewCell {
    
    // MARK: - UIComponents
    
    private let mainImageView = UIImageView().then { $0.backgroundColor = .red }
    private let singerTitle = UILabel().then { $0.text = "아일릿"}
    
    private lazy var vStackView = UIStackView(
        arrangedSubviews: [
            mainImageView,
            singerTitle
        ]
        
    ).then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 8
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
        singerTitle.do {
            $0.textColor = .spotifyGray30
            $0.font = .font(.regular_kr)
        }
    }
    
    private func setHierarchy() {
        contentView.addSubview(vStackView)
        
        mainImageView.do {
            $0.clipsToBounds = true
        }
    }
    
    private func setLayout() {
        
        vStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        mainImageView.snp.makeConstraints {
            $0.height.equalTo(142)
            $0.width.equalTo(mainImageView.snp.height)
        }
        
        layoutIfNeeded()
        mainImageView.layer.cornerRadius = mainImageView.frame.size.width / 2
    }
    
    // MARK: - Methods
    
    func bindData(data: Artist) {
        self.mainImageView.image = UIImage(named: "imgArtist\(data.id)")
        self.singerTitle.text = data.artistName
        
    }
    
}
