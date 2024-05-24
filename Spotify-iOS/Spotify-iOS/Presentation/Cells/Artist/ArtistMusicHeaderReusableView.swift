//
//  ArtistMusicHeaderReusableView.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/22/24.
//

import UIKit

import SnapKit
import Then

protocol HeaderTapEventDelegate: AnyObject {
    func popularityHeaderDidTap()
}

final class ArtistMusicHeaderReusableView: UICollectionReusableView {
    
    // MARK: - Properties
    
    weak var delegate: HeaderTapEventDelegate?
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private var nextButton: UIButton?
    
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nextButton?.removeFromSuperview()
        titleLabel.snp.updateConstraints {
            $0.leading.equalToSuperview()
        }
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.textColor = .white
            $0.numberOfLines = 0
            $0.font = .systemFont(ofSize: 17, weight: .bold)
        }
    }
    
    private func setHierarchy() {
        self.addSubview(titleLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.height.equalTo(22)
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}

extension ArtistMusicHeaderReusableView {
    
    func configure(
        title: String,
        isIconIncluded: Bool, 
        isLeadingPaddingIncluded: Bool
    ) {
        titleLabel.text = title
        if isIconIncluded { setNextButton() }
        if isLeadingPaddingIncluded { updateTitleConstraint() }
    }
    
    func setNextButton() {
        self.nextButton = UIButton()
        self.addSubview(nextButton!)
        setButtonAction()
        
        nextButton!.do {
            $0.setImage(.icNextGray, for: .normal)
        }
        
        nextButton!.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing)
            $0.verticalEdges.equalToSuperview()
        }
    }
    
    func updateTitleConstraint() {
        titleLabel.snp.updateConstraints {
            $0.leading.equalToSuperview().inset(16)
        }
    }
    
    func setButtonAction() {
        nextButton?.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc
    func nextButtonDidTap() {
        delegate?.popularityHeaderDidTap()
    }
}
