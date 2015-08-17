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

    var ViewCellController : CategoryViewCell! = CategoryViewCell()
    
    @IBOutlet weak var tableView: UITableView!
    override  func viewDidLoad() {
        super.viewDidLoad()
        self.reload()
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "reload",
            name: "NeedReload",
            object: nil)
        
       
        
        
    }
    
    

    @IBAction func addMoney(sender: UIButton) {
        let layout = KLCPopupLayoutMake(KLCPopupHorizontalLayout.Center, KLCPopupVerticalLayout.Center)
        var popUpView = NSBundle.mainBundle().loadNibNamed("popUpAdd", owner: self, options: nil).last as! popUpAddViewController
        let popup = (KLCPopup) (contentView: popUpView, showType: KLCPopupShowType.BounceInFromBottom, dismissType: KLCPopupDismissType.BounceOutToTop, maskType: KLCPopupMaskType.Dimmed, dismissOnBackgroundTouch: true, dismissOnContentTouch: false)
        
        popup.showWithLayout(layout)
        
        
    }
    
    internal func reload(){
        tableView.reloadData()
    }
    


    
    @IBOutlet weak var ViewAddButton: UIView!
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return BalanceBrain.sharedInstance.balanceCategories.count
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
          tableView.reloadData()
        let layout = KLCPopupLayoutMake(KLCPopupHorizontalLayout.Center, KLCPopupVerticalLayout.Center)
        var popUpView = NSBundle.mainBundle().loadNibNamed("PopUpView", owner: self, options: nil).last as! PopUpViewController
        popUpView.categoryID = indexPath.row
        let popup = (KLCPopup) (contentView: popUpView, showType: KLCPopupShowType.BounceInFromBottom, dismissType: KLCPopupDismissType.BounceOutToTop, maskType: KLCPopupMaskType.Dimmed, dismissOnBackgroundTouch: true, dismissOnContentTouch: false)
        
        popup.showWithLayout(layout)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("balanceCategory", forIndexPath: indexPath) as! CategoryViewCell
        cell.title.text = BalanceBrain.sharedInstance.balanceCategories[indexPath.row].title
        cell.moneyAmount.text = "\(BalanceBrain.sharedInstance.balanceCategories[indexPath.row].currentBalance.description)$"
        
        
        cell.frontView.backgroundColor = colorSet1[indexPath.row % colorSet1.count]
        
        let newFrame = cell.frontView
        var PLeft = CGFloat(BalanceBrain.sharedInstance.balanceCategories[indexPath.row].percentLeft/100)
        let Cy = cell.backView.center.y
        let Cx = cell.backView.center.x
        let Width = cell.backView.bounds.width

      
        cell.Constraint?.constant = PLeft * Width - Width
        println(ViewCellController.Constraint?.constant)
        println(PLeft * Width - Width )
     
      //  newFrame.transform = CGAffineTransformMakeScale(PLeft , 1)
       //newFrame.center = CGPointMake(Cx - ((1 - PLeft) * cell.backView.bounds.width / 2 ), Cy)

        //println(newFrame.center)
        //println(PLeft * cell.backView.bounds.width)
       
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
