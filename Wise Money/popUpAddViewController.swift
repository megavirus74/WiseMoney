//
//  popUpAddViewController.swift
//  Wise Money
//
//  Created by Zhenya Zhorinitsky on 15.08.15.
//  Copyright (c) 2015 volkoivan. All rights reserved.
//

import UIKit

class popUpAddViewController: UIView {
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var comment: UITextField!
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        
        doneButton.layer.cornerRadius = 4
        doneButton.layer.masksToBounds = true
    }
    
    @IBAction func AddMoney(sender: AnyObject) {
        var operation = BalanceOperation.MR_createEntity()
        operation.date = NSDate()
        operation.comment = comment.text
        operation.moneyValue = (self.input.text as NSString).doubleValue
        operation.balanceCategory = nil
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
        dismissPresentingPopup()
        NSNotificationCenter.defaultCenter().postNotificationName("NeedReload", object: nil)
    }
}