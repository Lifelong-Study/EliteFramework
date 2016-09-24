//
//  EliteTableViewCell.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/9/22.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit

public extension UITableViewCell {
    
    //
    override class func loadFromNibNamed(nibNamed: String, bundle : Bundle? = nil) -> UITableViewCell? {
        return UINib(nibName: nibNamed, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UITableViewCell
    }
}
