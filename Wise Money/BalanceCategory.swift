//
//  BalanceCategory.swift
//  Wise Money
//
//  Created by Волков Иван on 01.07.15.
//  Copyright (c) 2015 volkoivan. All rights reserved.
//

import Foundation
import CoreData

@objc(BalanceCategory)
class BalanceCategory: NSManagedObject {

    @NSManaged var categoryDescription: String
    @NSManaged var categoryPercent: NSNumber
    @NSManaged var title: String
    @NSManaged var balanceOperations: NSOrderedSet

}
