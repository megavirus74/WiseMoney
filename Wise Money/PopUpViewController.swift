//
//  PopUpViewViewController.swift
//  Wise Money
//
//  Created by Волков Иван on 24.06.15.
//  Copyright (c) 2015 volkoivan. All rights reserved.
//

import UIKit

class PopUpViewController: UIView {

    @IBOutlet weak var comment: UITextField!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    var categoryID = Int()
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        
        doneButton.layer.cornerRadius = 4
        doneButton.layer.masksToBounds = true
    }
    
    @IBAction func subtract() {
        var operation = BalanceOperation.MR_createEntity()
        operation.date = NSDate()
        operation.comment = comment.text
        operation.moneyValue = (self.input.text as NSString).doubleValue
        operation.balanceCategory = BalanceBrain.sharedInstance.balanceCategories[categoryID]
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
        dismissPresentingPopup()
        NSNotificationCenter.defaultCenter().postNotificationName("NeedReload", object: nil)
    }
}
