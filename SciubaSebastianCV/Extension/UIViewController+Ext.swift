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
            mailVC.mailComposeDelegate = self
            mailVC.setToRecipients(["s.sciuba@icloud.com"])
            mailVC.setMessageBody(message, isHTML: false)
            present(mailVC, animated: true, completion: nil)
        } else {
            let title = "Error".localized
            let message = "You don't have any mailbox on Your device".localized
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: - MFMailComposeViewControllerDelegate

extension UIViewController : MFMailComposeViewControllerDelegate {
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            break
        case .failed:
            break
        case .saved:
            break
        case .sent:
            break
        @unknown default:
            fatalError()
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
