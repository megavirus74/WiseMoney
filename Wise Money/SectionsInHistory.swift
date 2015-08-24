//
//  SectionsInHistory.swift
//  Wise Money
//
//  Created by Zhenya Zhorinitsky on 19.08.15.
//  Copyright (c) 2015 volkoivan. All rights reserved.
//

import Foundation

class Section : NSObject {
    var title = String()
    var date = NSDate()
    var operations = [BalanceOperation]()
}