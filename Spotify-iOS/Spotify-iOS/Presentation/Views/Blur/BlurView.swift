//
//  BlurView.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/23/24.
//

import UIKit
import SnapKit

final class BlurView: UIVisualEffectView {
    
    // MARK: - UI Components
    private let stackView = UIStackView()
    private let closeButton = UIButton()
    
    // Initialize buttons
    private let button1 = UIButton(type: .system)
    private let button2 = UIButton(type: .system)
    private let button3 = UIButton(type: .system)
    
    // MARK: - Initializer
    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        self.effect = UIBlurEffect(style: .light)
        
        // StackView Configuration
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        
        // Buttons Configuration
        [button1, button2, button3].forEach {
            $0.setTitle("Button", for: .normal)
            stackView.addArrangedSubview($0)
        }
        
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
        stackView.addArrangedSubview(closeButton)
        
        // Add StackView to BlurView
        contentView.addSubview(stackView)
        
        // Layout
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    @objc private func closeButtonDidTap() {
        hide()
    }
    
    // MARK: - Public Methods
    func show(in view: UIView) {
        view.addSubview(self)
        self.frame = view.bounds
        self.alpha = 0.0
        
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1.0
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0.0
        }) { _ in
            self.removeFromSuperview()
        }
    }
}

