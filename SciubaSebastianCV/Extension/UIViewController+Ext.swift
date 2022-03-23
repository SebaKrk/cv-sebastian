//
//  UIViewController+Ext.swift
//  SciubaSebastianCV
//
//  Created by akra on 23/03/2022.
//

import Foundation
import UIKit
import SafariServices
import MessageUI

extension UIViewController {
    
    //    MARK: - SafariService
    
    func showSafariService(with url: String) {
        guard let url = URL(string: url) else {return}
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
    
    //    MARK: - MessageUI
    
    func showMailMassageUI (subject: String, message: String) {
        if MFMailComposeViewController.canSendMail() {
            let mailVC = MFMailComposeViewController()
            mailVC.setSubject(subject)
            mailVC.setToRecipients(["s.sciuba@icloud.com"])
            mailVC.setMessageBody(message, isHTML: false)
            present(mailVC, animated: true, completion: nil)
        } else {
            print("MFMailComposeViewController failed")
        }
    }
}
