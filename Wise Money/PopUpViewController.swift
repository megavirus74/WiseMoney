//
//  PopUpViewViewController.swift
//  Wise Money
//
//  Created by Волков Иван on 24.06.15.
//  Copyright (c) 2015 volkoivan. All rights reserved.
//

import UIKit

class PopUpViewController: UIView {

    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var input: UITextField!
    var categoryID = Int()
    
    
    @IBAction func subtract() {
        var operation = BalanceOperation.MR_createEntity()
        operation.date = NSDate()
        operation.moneyValue = (self.input.text as NSString).doubleValue
        operation.balanceCategory = BalanceBrain.sharedInstance.balanceCategories[categoryID]
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
        
    }

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
