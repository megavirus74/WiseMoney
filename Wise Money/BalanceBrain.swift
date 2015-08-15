//
//  BalanceBrain.swift
//  Wise Money
//
//  Created by Волков Иван on 24.06.15.
//  Copyright (c) 2015 volkoivan. All rights reserved.
//

import UIKit

class BalanceBrain {
    static let sharedInstance = BalanceBrain()
    
    var balanceCategories = [BalanceCategory]()
    
    var totalBalance = Double()
    
    var currentBalance: Double {
        get {
            var sum = Double()
            for category in balanceCategories {
                sum+=category.currentBalance
            }
            return sum
        }
    }
    
    init () {
        let savedBalanceCategories = BalanceCategory.MR_findAll() as? [BalanceCategory]
        if (savedBalanceCategories?.count>0) {
            balanceCategories = savedBalanceCategories!
        }
        else {
            addCategory("General", categoryDescription: "Important stuff", categoryPercent: 0.55)
            addCategory("Reserve", categoryDescription: "Your reservation", categoryPercent: 0.1)
            addCategory("Savings", categoryDescription: "ALALA", categoryPercent: 0.05)
            addCategory("Gifts", categoryDescription: "Your reservation", categoryPercent: 0.3)
        }
        addMoney(100)
        if let total = NSUserDefaults.standardUserDefaults().objectForKey("totalBalance") as? Double
        {
            totalBalance = NSUserDefaults.standardUserDefaults().objectForKey("totalBalance") as! Double
        }
        else {
            totalBalance = 0
            addMoney(0)
        }
    }
    
    func addMoney (money: Double) {
        totalBalance+=money;
        NSUserDefaults.standardUserDefaults().setDouble(totalBalance, forKey: "totalBalance")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func addCategory (title: String, categoryDescription: String, categoryPercent: NSNumber) {
        var category = BalanceCategory.MR_createEntity()
        category.title = title
        category.categoryDescription = categoryDescription
        category.categoryPercent = categoryPercent
        balanceCategories.append(category)
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
    }
    
}
