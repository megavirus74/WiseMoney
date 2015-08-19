//
//  HistoryViewController.swift
//  Wise Money
//
//  Created by Zhenya Zhorinitsky on 17.08.15.
//  Copyright (c) 2015 volkoivan. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    @IBOutlet weak var tableView: UITableView!

    
    
    var colorRed = UIColor(red: 215/255, green: 35/255, blue: 35/255, alpha: 1)
    var colorGreen = UIColor(red: 41/255, green: 132/255, blue: 26/255, alpha: 1)
    var balanceOperations = BalanceOperation.MR_findAll() as! [BalanceOperation]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return balanceOperations.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.dequeueReusableCellWithIdentifier("balanceOperation", forIndexPath: indexPath) as! CategoryViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None

    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 2
    }
    
     func tableView(tableView: UITableView,
        titleForHeaderInSection section: Int)
        -> String {
         
            return "ASDASD"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("balanceOperation", forIndexPath: indexPath) as! CategoryViewCell
       // tableView.sectionHeaderHeight = balanceOperations[indexPath.row].date

        
        cell.moneyAmount.text = "\(balanceOperations[indexPath.row].moneyValue.stringValue)$"
        if (!(balanceOperations[indexPath.row].balanceCategory == nil)) {
            cell.title.text = balanceOperations[indexPath.row].balanceCategory?.title
            cell.frontView.backgroundColor = colorRed
        } else {
            cell.frontView.backgroundColor = colorGreen
            cell.title.text = ""
        }

        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
}
