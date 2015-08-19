//
//  SectionsInHistory.swift
//  Wise Money
//
//  Created by Zhenya Zhorinitsky on 19.08.15.
//  Copyright (c) 2015 volkoivan. All rights reserved.
//

import Foundation

class Section{
    
    let collation = UILocalizedIndexedCollation.currentCollation()
        as! UILocalizedIndexedCollation
    
    var sections: [Section] = []
    var balanceOperations = BalanceOperation.MR_findAll() as! [BalanceOperation]
    var today = NSDate()
    
    func SectionsCount(){
        
        if !(balanceOperations[1].date == today){
        //sections.count = sections.count + 1
        }
    }
    
}