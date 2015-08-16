//
//  CategoryViewCell.swift
//  Wise Money
//
//  Created by Волков Иван on 24.06.15.
//  Copyright (c) 2015 volkoivan. All rights reserved.
//

import UIKit

class CategoryViewCell: UITableViewCell {

    
    var MainController: CategoriesViewController!
    
    @IBOutlet weak var frontView: UIView! {
        didSet {
            frontView.layer.cornerRadius = 10;
            frontView.layer.masksToBounds = true;
        }
        
    }
    
    
    
    @IBOutlet weak var backView: UIView! {
        didSet {
            backView.layer.cornerRadius = 10;
            backView.layer.masksToBounds = true;
        }
    }
    
    
    @IBOutlet weak var moneyAmount: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var Constraint: NSLayoutConstraint!
    
    func changeToPressedState() {
        
    }
   // required init(coder aDecoder: NSCoder) {
        //super.init(coder: aDecoder)
        
    
        
   // }
    
    
    func Slider()
    {
        println("HOHOHOHO")
        let t = BalanceBrain.sharedInstance.balanceCategories.count
        
        for i in 1...t {
        Constraint.constant =  -(CGFloat(1 - BalanceBrain.sharedInstance.balanceCategories[i].percentLeft) * backView.bounds.width)
        }
    }
    
    
}
