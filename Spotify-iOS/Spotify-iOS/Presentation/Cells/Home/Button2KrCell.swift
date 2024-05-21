//
//  Button2KrCell.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/17/24.
//

import UIKit

import SnapKit
import Then

final class Button2KrCell: UICollectionViewCell {
    
    // MARK: - UIComponents
    
    private let mainImageView = UIImageView().then { $0.backgroundColor = .red }
    private let imageTitle = UILabel().then { $0.text = "text 입니다" }
    
    private lazy var vStackView = UIStackView(
        arrangedSubviews: [
            mainImageView,
            imageTitle
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
        
        imageTitle.do {
            $0.textColor = .spotifyGray30
            $0.font = .font(.regular_en)
            $0.numberOfLines = 2
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
    }
    
    
    // MARK: - Methods
    
    func bindData(data: RadioModel) {
        self.mainImageView.image = data.image
        self.imageTitle.text = data.title
    }
}
