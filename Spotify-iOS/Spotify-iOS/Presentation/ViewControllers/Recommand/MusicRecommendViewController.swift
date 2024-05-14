//
//  RecommendViewController.swift
//  Spotify-iOS
//
//  Created by 김민성 on 5/14/24.
//

import UIKit

import SnapKit
import Then

class MusicRecommendViewController: UIViewController {
    
    // MARK: - UIComponents
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = CGFloat.random(in: 0...1)
        
        setLayout()
        setRegister()
        setDelegate()
    }
    
    func setLayout() {
        
    }
    
    func setRegister() {
        
    }
    
    func setDelegate() {
        
    }
}
