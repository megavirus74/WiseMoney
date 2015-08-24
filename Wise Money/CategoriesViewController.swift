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
    
    var isCellAnimationRequired = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ViewAddButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "reloadCellsWithAnimation",
            name: "NeedReload",
            object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        isCellAnimationRequired = false
        self.view.layoutIfNeeded()
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        tableView.reloadData()
        self.view.layoutIfNeeded()
    }

    
    @IBAction func addMoney(sender: UIButton) {
        let layout = KLCPopupLayoutMake(KLCPopupHorizontalLayout.Center, KLCPopupVerticalLayout.AboveCenter)
        var popUpView = NSBundle.mainBundle().loadNibNamed("popUpAdd", owner: self, options: nil).last as! popUpAddViewController
        let popup = (KLCPopup) (contentView: popUpView, showType: KLCPopupShowType.BounceInFromTop, dismissType: KLCPopupDismissType.BounceOutToTop, maskType: KLCPopupMaskType.Dimmed, dismissOnBackgroundTouch: true, dismissOnContentTouch: false)
        
        popup.showWithLayout(layout)
        popUpView.input.becomeFirstResponder()
    }
    
    func reloadCellsWithAnimation(){
        tableView.reloadData()
        isCellAnimationRequired = true
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BalanceBrain.sharedInstance.balanceCategories.count
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let layout = KLCPopupLayoutMake(KLCPopupHorizontalLayout.Center, KLCPopupVerticalLayout.AboveCenter)
        var popUpView = NSBundle.mainBundle().loadNibNamed("PopUpView", owner: self, options: nil).last as! PopUpViewController
        popUpView.categoryID = indexPath.row
        let popup = (KLCPopup) (contentView: popUpView, showType: KLCPopupShowType.BounceInFromTop, dismissType: KLCPopupDismissType.BounceOutToTop, maskType: KLCPopupMaskType.Dimmed, dismissOnBackgroundTouch: true, dismissOnContentTouch: false)
        popup.showWithLayout(layout)
        popUpView.input.becomeFirstResponder()
    }
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("balanceCategory", forIndexPath: indexPath) as! CategoryViewCell
        cell.title.text = BalanceBrain.sharedInstance.balanceCategories[indexPath.row].title
        cell.balanceCategory = BalanceBrain.sharedInstance.balanceCategories[indexPath.row]
        cell.moneyAmount.text = "\(cell.balanceCategory.currentBalance.description)$"
        
        cell.calculateWidth()
        if (isCellAnimationRequired) {
            UIView.animateWithDuration(0.5) {
                cell.frontView.layoutIfNeeded()
            }
        }

        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.frontView.backgroundColor = colorSet1[indexPath.row % colorSet1.count]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
