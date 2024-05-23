//
//  CardViewController.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/16/24.
//

import UIKit

import SnapKit
import Then

class CardViewController: UIViewController {
    
    private let profileImageView = UIImageView()
    
    private let tasteChipButton = UIButton()
    private let removeButton = UIButton()
    
    private lazy var hStackView = UIStackView(
        arrangedSubviews: [
            profileImageView,
            removeButton,
            tasteChipButton
        ]
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setHierarchy()
        setLayout()
        
        removeButton.addTarget(self, action: #selector(chipButtonDidTap), for: .touchUpInside)
        
        navigationItem.hidesBackButton = true
    }
    
    private func setUI() {
        view.backgroundColor = .blue
        
        profileImageView.do {
            $0.image = .imgProfile
        }
        
        tasteChipButton.do {
            $0.setImage(.imgChipsTasteOn, for: .normal)
        }
        
        removeButton.do {
            $0.setImage(.imgChipsX, for: .normal)
        }
        
        hStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.distribution = .fill
        }
    }
    
    private func setHierarchy() {
        view.addSubview(
            hStackView
        )
    }
    
    private func setLayout() {
        hStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(9)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.height.equalTo(28)
        }
    }
    
    @objc func chipButtonDidTap() {
        if let navigationController = self.navigationController {
            let homeViewController = HomeViewController()
            var viewControllers = navigationController.viewControllers
            viewControllers.removeLast()
            viewControllers.append(homeViewController)
            navigationController.setViewControllers(viewControllers, animated: false)
        }
    }
}
