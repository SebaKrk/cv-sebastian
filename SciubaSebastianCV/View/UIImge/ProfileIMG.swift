//
//  CostumeUIImage.swift
//  SciubaSebastianCV
//
//  Created by akra on 18/03/2022.
//

import Foundation
import UIKit

class ProfileIMG : UIImageView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        image = UIImage(named: "ŚciubaS")
        layer.cornerRadius = 75
        layer.borderColor = UIColor.systemBlue.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
        contentMode = .scaleAspectFill
    }
}
