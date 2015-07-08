//
//  CategoryViewCell.swift
//  Wise Money
//
//  Created by Волков Иван on 24.06.15.
//  Copyright (c) 2015 volkoivan. All rights reserved.
//

import UIKit

class CategoryViewCell: UITableViewCell {
    var popViewController: PopUpViewController!
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
    
    @IBAction func subtract(sender: UIButton) {
        var parent = self.superview as! UITableView
        PopUpViewController.categoryID = parent.indexPathForCell(self)!.row
        self.popViewController = PopUpViewController(nibName: "PopUpViewController", bundle: nil)
        self.popViewController.title = "This is a popup view"
        self.popViewController.showInView(self.superview?.superview?.superview?.superview, animated: true)
    }
    
    func changeToPressedState() {
        var r, g, b, a: CGFloat
        //self.frontView.backgroundColor!.getRed(r, green: g, blue: b, alpha: a)
        
    }
}
