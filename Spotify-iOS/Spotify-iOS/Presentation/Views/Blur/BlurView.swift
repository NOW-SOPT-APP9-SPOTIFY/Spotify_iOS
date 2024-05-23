//
//  BlurView.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/23/24.
//

import UIKit
import SnapKit
import Then

final class BlurView: UIVisualEffectView {
    
    // MARK: - Properties
    
    private var albumId: Int = 0
    private var title: String = ""
    private var artist: String = ""
    
    // MARK: - UI Components
    
    private lazy var artistView = makeInfoView(title: "아티스트 보기", image: .icUserprofile)
    
    private lazy var blurVStackView = UIStackView(
        arrangedSubviews: [
            makeInfoView(title: "내 라이브러리 추가하기", image: .icPlusCircleGray),
            makeInfoView(title: "관심 없음", image: .icThumbDown),
            artistView,
            makeInfoView(title: "라디오 보러가기", image: .icShuffle),
            makeInfoView(title: "공유", image: .icShare)
        ]
    )
    private let closeButton = UIButton()
    
    private let albumImageView = UIImageView()
    private let albumTitleLabel = UILabel()
    private let albumArtistLabel = UILabel()
    
    // MARK: - Initializer
    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        
        blurVStackView.do {
            $0.axis = .vertical
            $0.spacing = 12
            $0.distribution = .fill
        }
        
        closeButton.do {
            $0.setTitle("닫기", for: .normal)
            $0.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
        }
        
        albumTitleLabel.do {
            $0.font = .font(.h2_en_bold)
            $0.textColor = .white
        }
        
        albumArtistLabel.do {
            $0.font = .font(.h3_en_bold)
            $0.textColor = .spotifyGray30
        }
    }
    
    private func setHierarchy() {
        blurVStackView.addArrangedSubview(closeButton)
        
        contentView.addSubviews(
            blurVStackView,
            albumImageView,
            albumTitleLabel,
            albumArtistLabel
        )
        
    }
    
    private func setLayout() {
        blurVStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(425)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        albumImageView.snp.makeConstraints {
            $0.width.height.equalTo(52)
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(337)
        }
        
        albumTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(albumImageView.snp.trailing).offset(12)
            $0.top.equalToSuperview().inset(345)
        }
        
        albumArtistLabel.snp.makeConstraints {
            $0.leading.equalTo(albumImageView.snp.trailing).offset(12)
            $0.top.equalTo(albumTitleLabel.snp.bottom).offset(8)
        }
    }
    
    // MARK: - Methods
    
    func show(in view: UIView) {
        guard let tabBarController = view.window?.rootViewController as? UITabBarController else { return }
        
        view.addSubview(self)
        
        self.frame = view.bounds
        self.alpha = 0.0
        
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1.0
            tabBarController.tabBar.isHidden = true
        }
    }
    
    func hide() {
        guard let tabBarController = self.window?.rootViewController as? UITabBarController else { return }
        
        UIView.animate(withDuration: 0.3) {
            self.alpha = 0.0
        } completion: { _ in
            self.removeFromSuperview()
            tabBarController.tabBar.isHidden = false
        }
        
    }
    
    func setData(id: Int, title: String, artist: String) {
        self.albumImageView.image = UIImage(named: "imgMusicCard\(id)")
        self.albumTitleLabel.text = title
        self.albumArtistLabel.text = artist
    }
    
    private func makeInfoView(title: String, image: UIImage) -> UIView {
        
        let containerView = UIView()
        
        let label = UILabel().then {
            $0.text = title
            $0.textColor = .white
            $0.font = UIFont(name: "Pretendard-Medium", size: 13)
        }
        
        let leftImage = UIImageView().then {
            $0.image = image
        }
        
        containerView.addSubviews(
            leftImage,
            label
        )
        
        leftImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.leading.equalToSuperview().inset(26)
            $0.width.height.equalTo(24)
        }
        
        label.snp.makeConstraints {
            $0.centerY.equalTo(leftImage)
            $0.leading.equalTo(leftImage.snp.trailing).offset(22)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        containerView.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        return containerView
    }
    
    // MARK: - @Objc Function
    
    @objc private func closeButtonDidTap() {
        hide()
    }
    
}
