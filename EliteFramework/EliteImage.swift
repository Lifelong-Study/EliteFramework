//
//  EliteImage.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/3/9.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit


struct RGBA {
    private var color: UInt32
    
    var redComponent: UInt8 {
        return UInt8((color >> 24) & 255)
    }
    
    var greenComponent: UInt8 {
        return UInt8((color >> 16) & 255)
    }
    
    var blueComponent: UInt8 {
        return UInt8((color >> 8) & 255)
    }
    
    var alphaComponent: UInt8 {
        return UInt8((color >> 0) & 255)
    }
    
    init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) {
        let red   = UInt32(red)
        let green = UInt32(green)
        let blue  = UInt32(blue)
        let alpha = UInt32(alpha)
        color = (red << 24) | (green << 16) | (blue << 8) | (alpha << 0)
    }
    
    static let red     = RGBA(red: 255, green: 0,   blue: 0,   alpha: 255)
    static let green   = RGBA(red: 0,   green: 255, blue: 0,   alpha: 255)
    static let blue    = RGBA(red: 0,   green: 0,   blue: 255, alpha: 255)
    static let white   = RGBA(red: 255, green: 255, blue: 255, alpha: 255)
    static let black   = RGBA(red: 0,   green: 0,   blue: 0,   alpha: 255)
    static let magenta = RGBA(red: 255, green: 0,   blue: 255, alpha: 255)
    static let yellow  = RGBA(red: 255, green: 255, blue: 0,   alpha: 255)
    static let cyan    = RGBA(red: 0,   green: 255, blue: 255, alpha: 255)
    static let clear   = RGBA(red: 0,   green: 0,   blue: 0,   alpha: 0)
    
    static let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Little.rawValue
    
    static func ==(lhs: RGBA, rhs: RGBA) -> Bool {
        return lhs.color == rhs.color
    }
}

public extension UIImage {
    
    //
    fileprivate convenience init(image: UIImage?) {
        if let cgimage = image?.cgImage {
            self.init(cgImage: cgimage)
        } else {
            self.init()
        }
    }
    
    // initialization
    convenience init(color: UIColor) {
        
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        
        color.setFill()
        
        UIRectFill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.init(image: image)
    }
    
    convenience init(layer: CALayer) {
        UIGraphicsBeginImageContextWithOptions(layer.bounds.size, false, 0.0)
        
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.init(image: image)
    }
    
    
    convenience init(render view: UIView, from: RenderDirection, to: RenderDirection, colors: [UIColor]) {
        let layer = CALayer()
        
        layer.bounds = view.bounds
        
        layer.renderGradient(from: from, to: to, colors: colors)
        
        self.init(layer: layer)
    }
    
    // function
    func radians(_ degrees: Double) -> CGFloat {
        return CGFloat(degrees * Double.pi / 180.0)
    }
    
    /*! 影像剪裁 */
    func trimImageWithMask(_ maskFrame: CGRect) -> UIImage? {
        if let cgimage = self.cgImage {
            if let imageRef = cgimage.cropping(to: maskFrame) {
                return UIImage(cgImage: imageRef)
            }
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
        let imageData = image?.jpegData(compressionQuality: CGFloat(quality))
        UIGraphicsEndImageContext()
        
        
        return UIImage(data: imageData!)
    }
    
    //!
    func rotate(orientation: UIImage.Orientation) -> UIImage? {
        
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
    
    // 將圖片上的 from 的替換成 to 的顏色
    func replaceColor(from: UIColor, to: UIColor) -> UIImage? {
        var fromR: CGFloat = 0.0, fromG: CGFloat = 0.0, fromB: CGFloat = 0.0, fromA: CGFloat = 0.0
        var   toR: CGFloat = 0.0,   toG: CGFloat = 0.0,   toB: CGFloat = 0.0,   toA: CGFloat = 0.0
        
        from.getRed(&fromR, green: &fromG, blue: &fromB, alpha: &fromA)
        to.getRed(&toR, green: &toG, blue: &toB, alpha: &toA)
        
        let fromRGBA = RGBA.init(red: UInt8(fromR * 255.0), green: UInt8(fromB * 255.0), blue: UInt8(fromB * 255.0), alpha: UInt8(fromA * 255.0))
        let   toRGBA = RGBA.init(red: UInt8(toR * 255.0),   green: UInt8(toG * 255.0),   blue: UInt8(toB * 255.0),   alpha: UInt8(toA * 255.0))
        
        return replaceColor(from: fromRGBA, to: toRGBA)
    }
    
    private func replaceColor(from: RGBA, to: RGBA) -> UIImage? {
        guard let inputCGImage = self.cgImage else {
            print("unable to get cgImage")
            return nil
        }
        
        let colorSpace       = CGColorSpaceCreateDeviceRGB()
        let width            = inputCGImage.width
        let height           = inputCGImage.height
        let bytesPerPixel    = 4
        let bitsPerComponent = 8
        let bytesPerRow      = bytesPerPixel * width
        let bitmapInfo       = RGBA.bitmapInfo
        
        guard let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo) else {
            print("unable to create context")
            return nil
        }
        context.draw(inputCGImage, in: CGRect(x: 0, y: 0, width: width, height: height))
        
        guard let buffer = context.data else {
            print("unable to get context data")
            return nil
        }
        
        let pixelBuffer = buffer.bindMemory(to: RGBA.self, capacity: width * height)
        
        for row in 0 ..< Int(height) {
            for column in 0 ..< Int(width) {
                let offset = row * width + column
                if pixelBuffer[offset] == from {
                    pixelBuffer[offset] = to
                }
            }
        }
        
        if let outputCGImage = context.makeImage() {
            return UIImage(cgImage: outputCGImage, scale: scale, orientation: imageOrientation)
        } else {
            return nil
        }
    }
    
}

