//
//  ResDetailsLabel.swift
//  SciubaSebastianCV
//
//  Created by akra on 22/03/2022.
//
import UIKit


class ResDetailsLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        textColor = .black
        textAlignment = .center
        font = UIFont.boldSystemFont(ofSize: 18)
        numberOfLines = 0
    }
    
}
