//
//  NYTUtility.swift
//  NYTimesArticles
//
//  Created by Suneelahammad Shaik on 10/02/18.
//  Copyright © 2018 Suneelahammad Shaik. All rights reserved.
//
import UIKit
import Foundation

class NYTUtility: NSObject {
   static let shared = NYTUtility()
    
    //Creates alertview controller
    public func createAlertController(message: String) -> (UIAlertController) {
        let alertController = UIAlertController(title: NYTConstants.AppDetails.AppName, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: NYTConstants.WarningMessageAlert.OK, style: .default, handler: nil))
        return alertController
    }
    //Creates a no dat alable to show on no data received from server
    public func createNoDataLabel(tableView:UITableView) -> UILabel {
        let noDataLabel: UILabel  = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        noDataLabel.text          = NYTConstants.WarningMessageAlert.noDataFound
        noDataLabel.textColor     = UIColor.black
        noDataLabel.textAlignment = .center
        noDataLabel.tag = 100
        return noDataLabel
    }
}
