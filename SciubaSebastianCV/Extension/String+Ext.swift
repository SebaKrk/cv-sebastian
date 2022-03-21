//
//  String+Ext.swift
//  SciubaSebastianCV
//
//  Created by akra on 21/03/2022.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
