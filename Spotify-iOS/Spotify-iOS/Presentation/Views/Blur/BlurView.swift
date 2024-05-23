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
    
    // MARK: - UI Components
    private lazy var blurVStackView = UIStackView(
        arrangedSubviews: [makeInfoView(title: "내 라이브러리 추가하기", image: .icPlusCircleGray),
                           makeInfoView(title: "관심 없음", image: .icThumbDown),
                           makeInfoView(title: "아티스트 보기", image: .icUserprofile),
                           makeInfoView(title: "라디오 보러가기", image: .icShuffle),
                           makeInfoView(title: "공유", image: .icShare),
                          ]
    )
    private let closeButton = UIButton()
    
    // MARK: - Initializer
    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setUI() {
        self.effect = UIBlurEffect(style: .light)
        
        blurVStackView.do {
            $0.axis = .vertical
            $0.spacing = 12
            $0.distribution = .fill
        }
        
        closeButton.setTitle("닫기", for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
        blurVStackView.addArrangedSubview(closeButton)
        
        contentView.addSubview(blurVStackView)
        
        // Layout
        blurVStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(425)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    @objc private func closeButtonDidTap() {
        hide()
    }
    
    // MARK: - Public Methods
    func show(in view: UIView) {
        guard let tabBarController = view.window?.rootViewController as? UITabBarController else { return }
        
        tabBarController.tabBar.isHidden = true
        
        view.addSubview(self)
        self.frame = view.bounds
        self.alpha = 0.0
        
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1.0
        }
    }
    
    func hide() {
        guard let tabBarController = self.window?.rootViewController as? UITabBarController else { return }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0.0
        }) { _ in
            self.removeFromSuperview()
            tabBarController.tabBar.isHidden = false
        }
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
        
        containerView.addSubview(leftImage)
        containerView.addSubview(label)
        
        leftImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.leading.equalToSuperview().inset(26)
            $0.width.height.equalTo(24) // Assuming a square image
        }
        
        label.snp.makeConstraints {
            $0.centerY.equalTo(leftImage)
            $0.leading.equalTo(leftImage.snp.trailing).offset(22)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        containerView.snp.makeConstraints {
            $0.height.equalTo(50) // Assuming a fixed height for the info views
        }
        
        return containerView
    }
}
