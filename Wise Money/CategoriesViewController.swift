//
//  CategoriesViewController.swift
//  Wise Money
//
//  Created by Волков Иван on 24.06.15.
//  Copyright (c) 2015 volkoivan. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var colorSet1 = [UIColor(red: 236/255, green: 208/255, blue: 102/255, alpha: 1), UIColor(red: 217/255, green: 91/255, blue: 67/255, alpha: 1)]
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }

    @IBAction func addMoney(sender: UIButton) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BalanceBrain.sharedInstance.balanceCategories.count
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let layout = KLCPopupLayoutMake(KLCPopupHorizontalLayout.Center, KLCPopupVerticalLayout.Center)
        var popUpView = UIView(frame: CGRectMake(0, 0, 300, 400))
        popUpView.backgroundColor = UIColor.blackColor()
        let dismissButton = UIButton.buttonWithType(UIButtonType.Custom)
        popUpView.layer.cornerRadius = 12.0
        
        let popup = (KLCPopup) (contentView: popUpView, showType: KLCPopupShowType.BounceInFromBottom, dismissType: KLCPopupDismissType.BounceOutToTop, maskType: KLCPopupMaskType.Dimmed, dismissOnBackgroundTouch: true, dismissOnContentTouch: false)
        popup.showWithLayout(layout)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("balanceCategory", forIndexPath: indexPath) as! CategoryViewCell
        cell.title.text = BalanceBrain.sharedInstance.balanceCategories[indexPath.row].title
        cell.moneyAmount.text = "\(BalanceBrain.sharedInstance.balanceCategories[indexPath.row].currentBalance.description)$"
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
