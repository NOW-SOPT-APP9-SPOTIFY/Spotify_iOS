//
//  BlurViewController.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/24/24.
//

import UIKit

import Then
import SnapKit

final class BlurViewController: UIViewController {
    
    // MARK: - UIComponents
    
    private let closeButton = UIButton().then {
        $0.setTitle("Close", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
    }
    
    private let blurView = UIVisualEffectView().then {
        $0.effect = UIBlurEffect(style: .light)
    }
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        setActions()
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        view.backgroundColor = .clear
    }

    private func setHierarchy() {
        view.addSubview(blurView)
        blurView.contentView.addSubview(closeButton)
    }
    
    private func setLayout() {
        blurView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        closeButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - Actions
    
    private func setActions() {
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    @objc private func closeButtonTapped() {
        dismissViewControllerWithAnimation()
    }
    
    func setData(albumId: Int) {
        // Function to set data with albumId
    }
    
    // MARK: - Animation Methods
    
    func presentViewControllerWithAnimation(in parentViewController: UIViewController) {
        parentViewController.present(self, animated: false) {
            self.view.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
            UIView.animate(withDuration: 0.3, animations: {
                self.view.transform = CGAffineTransform.identity
            })
        }
    }
    
    private func dismissViewControllerWithAnimation() {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        }) { _ in
            self.dismiss(animated: false, completion: nil)
        }
    }
}
