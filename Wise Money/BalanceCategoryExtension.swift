//
//  BalanceCategoryExtension.swift
//  Wise Money
//
//  Created by Волков Иван on 01.07.15.
//  Copyright (c) 2015 volkoivan. All rights reserved.
//

import Foundation
extension BalanceCategory {
    
    var totalBalance: Double {
        get {
            return BalanceBrain.sharedInstance.totalBalance * categoryPercent.doubleValue
        }
    }
    
    var currentBalance: Double {
        get {
            var sum = Double()
            for operation in balanceOperations {
                sum += (operation as! BalanceOperation).moneyValue.doubleValue
            }
            return totalBalance - sum
        }
    }
    
    var percentLeft: Double {
        get {
            if (totalBalance != 0) {
                return currentBalance / totalBalance * 100
            }
            else {
                return 0
            }
        }
    }
}