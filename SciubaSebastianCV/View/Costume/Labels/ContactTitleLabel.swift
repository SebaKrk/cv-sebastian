//
//  ContactTitleLabel.swift
//  SciubaSebastianCV
//
//  Created by Sebastian Sciuba on 14/03/2022.
//
import UIKit


class ContactTitleLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(labelTitle : String) {
        super.init(frame: .zero)
        text = labelTitle
        configure()
    }
    
    private func configure() {
        textColor = .black
        textAlignment = .left
        font = UIFont.boldSystemFont(ofSize: 18)
    }
    
}
