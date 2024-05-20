//
//  RoundBorderCustomButton.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/19/24.
//

import UIKit

import SnapKit

final class RoundBorderCustomButton: UIButton {

    // MARK: - Properties
    
    private var title: String
    private var verticalPadding: CGFloat
    private var horizontalPadding: CGFloat
    
    // MARK: - View Life Cycle
    
    init(title: String, verticalPadding: CGFloat, horizontalPadding: CGFloat) {
        self.title = title
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        super.init(frame: .zero)
        
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension RoundBorderCustomButton {
    
    // MARK: - Methods
    
    private func setStyle() {
        configuration = UIButton.Configuration.plain()
        configuration?.attributedTitle = AttributedString(title, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont.font(.regular_kr_semibold)]))
        configuration?.baseForegroundColor = .white
        configuration?.contentInsets = NSDirectionalEdgeInsets(
            top: verticalPadding,
            leading: horizontalPadding,
            bottom: verticalPadding,
            trailing: horizontalPadding
        )
        makeBorder(width: 1, color: .spotifyGray30)
        layer.cornerRadius = 15.5
    }
}
