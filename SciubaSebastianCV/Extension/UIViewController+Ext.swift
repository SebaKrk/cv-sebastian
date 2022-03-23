//
//  UIViewController+Ext.swift
//  SciubaSebastianCV
//
//  Created by akra on 23/03/2022.
//

import Foundation
import UIKit
import SafariServices

extension UIViewController {
    
    func showSafariService(with url: String) {
        guard let url = URL(string: url) else {return}
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
}
