//
//  EliteImage.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/3/9.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit

public extension UIImage {
    
    func maskImage(_ ige: UIImage, maskImage: UIImage) -> UIImage? {
        
//        let maskRef = maskImage.CGImage
//        
//        let mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
//                                     CGImageGetHeight(maskRef),
//                                     CGImageGetBitsPerComponent(maskRef),
//                                     CGImageGetBitsPerPixel(maskRef),
//                                     CGImageGetBytesPerRow(maskRef),
//                                     CGImageGetDataProvider(maskRef), nil, false)
//        
//        let maskedImageRef = CGImageCreateWithMask(image.CGImage, mask)
//        let maskedImage = UIImage(CGImage: maskedImageRef!)
//        
        return nil
    }
    
    
    
    convenience init(color: UIColor) {
        
        self.init()
        
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(rect.size)
        
        draw(in: rect)
        
        UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
    
    
    func radians(_ degrees: Double) -> CGFloat {
        return CGFloat(degrees * M_PI / 180.0)
    }
    
    /*! 影像剪裁 */
    func trimImageWithMask(_ maskFrame: CGRect) -> UIImage? {
    
        let imageRef = self.cgImage!.cropping(to: maskFrame)
        
        if imageRef != nil {
            return UIImage(cgImage: imageRef!)
        }
        
        return nil
    }
    
    //!
    func scaleToSize(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size);
        
        draw(in: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return image!;
    }
    
    //!
    func compress(maxWidth: Double, maxHeight: Double, quality: Double) -> UIImage? {
        
        var actualWidth  = Double(self.size.width)
        var actualHeight = Double(self.size.height)
        let maxRatio     = maxWidth / maxHeight;
        var imgRatio     = actualWidth / actualHeight;
        
        
        if actualHeight > maxHeight || actualWidth > maxWidth {
            if false {
            } else if imgRatio < maxRatio {
                // 根據  maxHeight 調節影像寬度
                imgRatio = maxHeight / actualHeight;
                actualWidth = imgRatio * actualWidth;
                actualHeight = maxHeight;
            } else if imgRatio > maxRatio {
                // 根據  maxWidth 調節影像高度
                imgRatio = maxWidth / actualWidth;
                actualHeight = imgRatio * actualHeight;
                actualWidth = maxWidth;
            } else {
                actualHeight = maxHeight;
                actualWidth = maxWidth;
            }
        }
        
        
        let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(actualWidth), height: CGFloat(actualHeight))
        UIGraphicsBeginImageContext(rect.size)
        draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        let imageData = UIImageJPEGRepresentation(image!, CGFloat(quality))
        UIGraphicsEndImageContext()
        
        
        return UIImage(data: imageData!)
    }
    
    //!
    func rotate(orientation: UIImageOrientation) -> UIImage? {
        
        if orientation != .right && orientation != .left {
            return self
        }
        
        UIGraphicsBeginImageContext(self.size)
        
        let context = UIGraphicsGetCurrentContext()
        
        if false {
        } else if orientation == .right {
            context!.rotate(by: radians(90))
        } else if orientation == .left {
            context!.rotate(by: radians(-90))
        }
        
        draw(at: CGPoint(x: 0, y: 0))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
}
