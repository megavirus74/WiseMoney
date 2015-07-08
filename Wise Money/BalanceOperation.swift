//
//  BalanceOperation.swift
//  Wise Money
//
//  Created by Волков Иван on 01.07.15.
//  Copyright (c) 2015 volkoivan. All rights reserved.
//

import Foundation
import CoreData

@objc(BalanceOperation)
class BalanceOperation: NSManagedObject {

    @NSManaged var comment: String
    @NSManaged var date: NSDate
    @NSManaged var moneyValue: NSNumber
    @NSManaged var balanceCategory: BalanceCategory

}
