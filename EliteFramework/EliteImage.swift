//
//  EliteImage.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/3/9.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit

public extension UIImage {
    
    convenience init(color: UIColor) {
        
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()
        
        if context == nil {
            self.init()
            return
        }
        
        CGContextSetFillColorWithColor(context!, color.CGColor)
        
        CGContextFillRect(context!, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        if image == nil {
            self.init()
        } else {
            self.init(CGImage: image!.CGImage!)
        }
    }
    
    func maskImage(ige: UIImage, maskImage: UIImage) -> UIImage? {
        
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
    
    func radians(degrees: Double) -> CGFloat {
        return CGFloat(degrees * M_PI / 180.0)
    }
    
    /*! 影像剪裁 */
    func trimImageWithMask(maskFrame: CGRect) -> UIImage? {
    
        let imageRef = CGImageCreateWithImageInRect(self.CGImage!, maskFrame)
        
        if imageRef != nil {
            return UIImage(CGImage: imageRef!)
        }
        
        return nil
    }
    
    //!
    func scaleToSize(size size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size);
        
        drawInRect(CGRectMake(0.0, 0.0, size.width, size.height))
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return image!;
    }
    
    //!
    func compress(maxWidth maxWidth: Double, maxHeight: Double, quality: Double) -> UIImage? {
        
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
        
        
        let rect = CGRectMake(0.0, 0.0, CGFloat(actualWidth), CGFloat(actualHeight))
        UIGraphicsBeginImageContext(rect.size)
        drawInRect(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        let imageData = UIImageJPEGRepresentation(image!, CGFloat(quality))
        UIGraphicsEndImageContext()
        
        
        return UIImage(data: imageData!)
    }
    
    //!
    func rotate(orientation orientation: UIImageOrientation) -> UIImage? {
        
        if orientation != .Right && orientation != .Left {
            return self
        }
        
        UIGraphicsBeginImageContext(self.size)
        
        let context = UIGraphicsGetCurrentContext()
        
        if false {
        } else if orientation == .Right {
            CGContextRotateCTM(context!, radians(90))
        } else if orientation == .Left {
            CGContextRotateCTM(context!, radians(-90))
        }
        
        drawAtPoint(CGPointMake(0, 0))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
}
