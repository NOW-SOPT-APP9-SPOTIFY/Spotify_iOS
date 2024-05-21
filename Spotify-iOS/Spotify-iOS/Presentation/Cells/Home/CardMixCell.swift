//
//  CardMixCell.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/17/24.
//

import UIKit

import SnapKit
import Then

final class CardMixCell: UICollectionViewCell {
    
    // MARK: - UIComponents
    
    private let mainImageView = UIImageView().then { $0.backgroundColor = .red }
    private let emptyView = UIView()
    private let imageInfoLabel = LabelFactory.build(
        text: "text 입니다. \n 아일릿",
        font: .font(.regular_kr),
        textColor: .white,
        textAlignment: .left
    )
    
    private lazy var vStackView = UIStackView(
        arrangedSubviews: [
            mainImageView,
            emptyView
        ]
        
    ).then {
        $0.axis = .vertical
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
        contentView.do {
            $0.layer.cornerRadius = 16
            $0.layer.masksToBounds = true
            
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 0.1
            $0.layer.shadowOffset = CGSize(width: 0, height: 2)
            $0.layer.shadowRadius = 4
        }
        
        emptyView.do {
            $0.backgroundColor = .black
        }
        
        imageInfoLabel.do {
            $0.numberOfLines = 2
        }
    }
    
    private func setHierarchy() {
        contentView.addSubview(vStackView)
        vStackView.addSubview(imageInfoLabel)
    }
    
    private func setLayout() {
        
        mainImageView.snp.makeConstraints {
            $0.height.equalTo(152)
        }
        
        emptyView.snp.makeConstraints {
            $0.height.equalTo(47)
        }
        
        vStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        imageInfoLabel.snp.makeConstraints {
            $0.edges.equalTo(emptyView).inset(8.5)
        }
    }
    
    // MARK: - Methods
    
    func bindData(image: UIImage) {
        self.mainImageView.image = image
    }
    
    func bindTitle(text: String) {
        self.imageInfoLabel.text = text
    }
    
}
