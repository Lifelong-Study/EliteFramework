//
//  XIBView.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2018/11/6.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit

class XIBView: UIControl {
    
    var xibView: UIView? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibView = self.loadFromNib()
        initXibView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibView = self.loadFromNib()
        initXibView()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    func initXibView() {
        // Nothing to do
    }
}

extension UIView {
    class func loadFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    @discardableResult
    func loadFromNib<T : UIView>() -> T? {
        guard let contentView = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
            // xib not loaded, or its top view is of the wrong type
            return nil
        }
        
        self.backgroundColor = contentView.backgroundColor
        self.addSubview(contentView)
        
        contentView.backgroundColor = .clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", views: ["view": contentView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", views: ["view": contentView]))
        
        return contentView
    }
}

