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
    
    
    @IBOutlet weak var moneyAmount: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var constraint: NSLayoutConstraint!
    
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
    
    var balanceCategory: BalanceCategory!
    
    func calculateWidth() {
        let newFrame = self.frontView
        var pLeft = CGFloat(balanceCategory.percentLeft/100)
        let width = self.backView.bounds.width
        self.constraint?.constant = pLeft * width - width
    }
    
    func layoutWithAnimation(){
        UIView.animateWithDuration(0.5) {
            self.frontView.layoutIfNeeded()
        }
    }
}
