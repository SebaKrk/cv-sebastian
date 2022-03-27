//
//  ConcactDataLabel.swift
//  SciubaSebastianCV
//
//  Created by Sebastian Sciuba on 14/03/2022.
//

import UIKit

class ConcactDataLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(textData : String) {
        super.init(frame: .zero)
        text = textData
        configure()
    }
    private func configure() {
        textColor = .systemBlue
        textAlignment = .left
    }
    
}
