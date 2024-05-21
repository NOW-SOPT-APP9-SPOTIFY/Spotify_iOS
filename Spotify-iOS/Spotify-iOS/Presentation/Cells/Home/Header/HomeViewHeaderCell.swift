//
//  HomeViewHeaderCell.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/20/24.
//

import UIKit

import SnapKit
import Then

final class HomeViewHeaderCell: UICollectionViewCell {
    
    // MARK: - UIComponents
    
    private let headertitleLabel = UILabel()
    
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
        
        headertitleLabel.do {
            $0.text = "나만을 위한 추천"
            $0.font = .font(.h1_kr_bold)
            $0.textColor = .white
        }
        
    }
    
    private func setHierarchy() {
        contentView.addSubview(headertitleLabel)
    }
    
    private func setLayout() {
        headertitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().inset(24)
        }
    }
    
    // MARK: - Methods
    
    func bindData(text: String) {
        self.headertitleLabel.text = text
    }
    
}
