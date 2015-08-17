//
//  popUpAddViewController.swift
//  Wise Money
//
//  Created by Zhenya Zhorinitsky on 15.08.15.
//  Copyright (c) 2015 volkoivan. All rights reserved.
//

import UIKit

class popUpAddViewController: UIView {
    
    @IBOutlet weak var input: UITextField!
    
    
    @IBAction func AddMoney(sender: AnyObject) {
        
        var operation = BalanceOperation.MR_createEntity()
        operation.date = NSDate()
        operation.moneyValue = (self.input.text as NSString).doubleValue
        BalanceBrain.sharedInstance.addMoney(operation.moneyValue.doubleValue)
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
        dismissPresentingPopup()
        NSNotificationCenter.defaultCenter().postNotificationName("NeedReload", object: nil)
        
    }
    
    
    
    
    
    
    
    
    
    
    
}