//
//  EliteViewController.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/2/16.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func <= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l <= r
  default:
    return !(rhs < lhs)
  }
}


public extension UIViewController {

    // 過場動畫
    public enum TransferAnimation {
        case push
        case present
        case fade
    }
    
    // MARK:
    public func transferViewController(_ identifier: String?, animation: TransferAnimation) {
        return transferViewController(storyboard: storyboard!, identifier: identifier, animation: animation)
    }
    
    // MARK:
    public func transferViewController(storyboard: String?, identifier: String?, animation: TransferAnimation) {
        
        if storyboard == nil {
            return ;
        }
        
        let storyboard = UIStoryboard(name: storyboard!, bundle: nil)
        
        return transferViewController(storyboard: storyboard, identifier: identifier, animation: animation)
    }
    
    // MARK:
    public func transferViewController(storyboard: UIStoryboard?, identifier: String?, animation: TransferAnimation) {
        
        // 防呆
        if storyboard == nil || identifier == nil || identifier?.length <= 0 {
            return
        }
        
        let tatgetViewController = storyboard!.instantiateViewController(withIdentifier: identifier!)
        
        let transition = CATransition()
        
        //
        switch animation {
        case .push:
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(tatgetViewController, animated: true)
            }
        case .present:
            DispatchQueue.main.async {
                self.navigationController?.present(tatgetViewController, animated: false, completion: nil)
            }
        case .fade:
            transition.type = kCATransitionFade
            transition.duration = 0.2
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
            
            view.window?.layer.add(transition, forKey: nil)
            
            DispatchQueue.main.async {
                self.present(tatgetViewController, animated: false, completion: nil)
            }
        }
    }
    
    // MARK:
    public func transferCameraViewController() -> UIImagePickerController {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .camera
        
        DispatchQueue.main.async {
            self.view.window?.rootViewController?.present(imagePickerController, animated: true, completion: nil)
        }
        
        return imagePickerController
    }
    
    // MARK:
    public func transferPhotoLibraryViewController() -> UIImagePickerController {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary
        
        DispatchQueue.main.async {
            self.present(imagePickerController, animated: true, completion: nil)
        }
        
        return imagePickerController
    }
    
    // MARK:
    public func alertView(title: String?, button: String?) {
        alertView(title: title, message: nil, button: button)
    }
    
    // MARK:
    public func alertView(title: String?, message: String?, button: String?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: button, style: .default, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
}

//class 
