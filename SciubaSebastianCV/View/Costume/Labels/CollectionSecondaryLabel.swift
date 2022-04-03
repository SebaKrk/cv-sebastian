//
//  CollectionSecondaryLabel.swift
//  SciubaSebastianCV
//
//  Created by akra on 03/04/2022.
//

import Foundation
import UIKit

class CollectionSecondaryLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
