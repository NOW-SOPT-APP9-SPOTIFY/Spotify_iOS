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
    
    var title: String {
        didSet {
            configuration?.attributedTitle = AttributedString(title, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont.font(self.font)]))
        }
    }
    private var font: FontLevel
    private var verticalPadding: CGFloat
    private var horizontalPadding: CGFloat
    private var cornerRadius: CGFloat
    
    // MARK: - View Life Cycle
    
    init(
        title: String,
        font: FontLevel,
        verticalPadding: CGFloat,
        horizontalPadding: CGFloat,
        cornerRadius: CGFloat
    ) {
        self.title = title
        self.font = font
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.cornerRadius = cornerRadius
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
        configuration?.attributedTitle = AttributedString(title, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont.font(self.font)]))
        configuration?.baseForegroundColor = .white
        configuration?.contentInsets = NSDirectionalEdgeInsets(
            top: verticalPadding,
            leading: horizontalPadding,
            bottom: verticalPadding,
            trailing: horizontalPadding
        )
        makeBorder(width: 1, color: .spotifyGray30)
        layer.cornerRadius = self.cornerRadius
    }
}
