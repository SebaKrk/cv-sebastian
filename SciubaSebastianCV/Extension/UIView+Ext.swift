//
//  UIView+Ext.swift
//  SciubaSebastianCV
//
//  Created by akra on 31/03/2022.
//

import Foundation
import UIKit

extension UIView {
    func convertDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let newDate = dateFormatter.date(from: date)
        let monthAndYerDateFormatter = DateFormatter()
        monthAndYerDateFormatter.dateFormat = "d MMMM yyyy"
        return monthAndYerDateFormatter.string(from: newDate ?? Date())
    }
}
