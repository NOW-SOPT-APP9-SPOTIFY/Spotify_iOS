//
//  HomeViewController.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/11/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - UIComponents
    
    private let rootView = HomeView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setDelegate()
        setRegister()
    }
    
    override func loadView() {
        self.view = rootView
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setDelegate() {
        
    }
    
    private func setRegister() {
        
    }
    
}
