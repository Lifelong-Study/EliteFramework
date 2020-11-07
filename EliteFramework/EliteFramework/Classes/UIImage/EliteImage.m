//
//  EliteCategories.m
//  BLEDrawingPad
//
//  Created by Lifelong-Study on 2015/4/21.
//  Copyright (c) 2015年 PaoYo Ding. All rights reserved.
//

#import "EliteImage.h"

@implementation UIImage (EliteImageCategory)

+ (UIImage *)imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 1.0);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGContextRelease(context);
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithLayer:(CALayer *)layer
{
    UIGraphicsBeginImageContext([layer frame].size);
    
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

//
- (UIImage *)scaledToSize:(CGSize)size
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(size);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [[self copy] drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    // Get the new image from the context
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return image;
}

// 影像壓縮
// maxWidth : 影像的最大寬度
// maxHeight: 影像的最大高度
// quality  : 影像品質的壓縮比( 0.0 ~ 1.0 )
- (UIImage *)imageCompressWithMaxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight quality:(CGFloat)quality
{
    float actualWidth  = self.size.width;
    float actualHeight = self.size.height;
    float maxRatio     = maxWidth / maxHeight;
    float imgRatio     = actualWidth/actualHeight;
    //    float compressionQuality = 0.5; // 影像品質的壓縮比 0.0 ~ 1.0
    
    if (actualHeight > maxHeight || actualWidth > maxWidth) {
        if (NO) {
        } else if (imgRatio < maxRatio) {
            // 根據  maxHeight 調節影像寬度
            imgRatio = maxHeight / actualHeight;
            actualWidth = imgRatio * actualWidth;
            actualHeight = maxHeight;
        } else if(imgRatio > maxRatio) {
            // 根據  maxWidth 調節影像高度
            imgRatio = maxWidth / actualWidth;
            actualHeight = imgRatio * actualHeight;
            actualWidth = maxWidth;
        } else {
            actualHeight = maxHeight;
            actualWidth = maxWidth;
        }
    }
    
    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    NSData *imageData = UIImageJPEGRepresentation(image, quality);
    UIGraphicsEndImageContext();
    
    return [UIImage imageWithData:imageData];
}

- (UIImage *)clearColor:(UIColor *)color
{
    return [self changeColor:color toColor:[UIColor clearColor]];
}

- (UIImage *)changeColor:(UIColor *)fromColor toColor:(UIColor *)toColor
{
    CGImageRef originalImage   = self.CGImage;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef bitmapContext = CGBitmapContextCreate(NULL,
                                                       CGImageGetWidth(originalImage),
                                                       CGImageGetHeight(originalImage), 8,
                                                       CGImageGetWidth(originalImage) * 4,
                                                       colorSpace,
                                                       kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(colorSpace);
    
    CGContextDrawImage(bitmapContext, CGRectMake(0, 0, CGBitmapContextGetWidth(bitmapContext),CGBitmapContextGetHeight(bitmapContext)), originalImage);
    
    UInt8 *data = CGBitmapContextGetData(bitmapContext);
    
    
    unsigned long bytes = CGBitmapContextGetHeight(bitmapContext) * CGBitmapContextGetBytesPerRow(bitmapContext);
    
    
    double inRed   = 0.0, inGreen   = 0.0, inBlue   = 0.0, inAlpha   = 0.0;
    double fromRed = 0.0, fromGreen = 0.0, fromBlue = 0.0, fromAlpha = 0.0;
    double toRed   = 0.0, toGreen   = 0.0, toBlue   = 0.0, toAlpha   = 0.0;
    
    // Get RGB values of fromColor
    unsigned long fromCountComponents = CGColorGetNumberOfComponents([fromColor CGColor]);
    if (fromCountComponents == 4) {
        const CGFloat *_components = CGColorGetComponents([fromColor CGColor]);
        fromRed   = _components[0];
        fromGreen = _components[1];
        fromBlue  = _components[2];
        fromAlpha = _components[3];
    }
    
    
    // Get RGB values for toColor
    unsigned long toCountComponents = CGColorGetNumberOfComponents([toColor CGColor]);
    if (toCountComponents == 4) {
        const CGFloat *_components = CGColorGetComponents([toColor CGColor]);
        toRed   = _components[0];
        toGreen = _components[1];
        toBlue  = _components[2];
        toAlpha = _components[3];
    }
    
    //
    for (NSInteger i = 0 ; i < bytes; i += 4) {
        
        //
        inRed   = data[i + 0] / 255.0;
        inGreen = data[i + 1] / 255.0;
        inBlue  = data[i + 2] / 255.0;
        inAlpha = data[i + 3] / 255.0;
        
        //
        if (inRed == fromRed && inGreen == fromGreen && inBlue == fromBlue && inAlpha == fromAlpha) {
            data[i + 0] = toRed;
            data[i + 1] = toGreen;
            data[i + 2] = toBlue;
            data[i + 3] = toAlpha;
        }
    }
    
    CGImageRef outImage = CGBitmapContextCreateImage(bitmapContext);
    
    UIImage *image = [UIImage imageWithCGImage:outImage];
    
    CGImageRelease(outImage);
    
    return image;
}

static inline double radians (double degrees) {return degrees * M_PI/180;}

- (UIImage *)rotate:(UIImageOrientation)orientation
{
    UIGraphicsBeginImageContext(self.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (orientation == UIImageOrientationRight) {
        CGContextRotateCTM (context, radians(90));
    } else if (orientation == UIImageOrientationLeft) {
        CGContextRotateCTM (context, radians(-90));
    } else if (orientation == UIImageOrientationDown) {
        // NOTHING
    } else if (orientation == UIImageOrientationUp) {
        CGContextRotateCTM (context, radians(90));
    }
    
    [self drawAtPoint:CGPointMake(0, 0)];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

// 影像剪裁
- (UIImage *)trimImageWithMask:(CGRect)maskFrame
{
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, maskFrame);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    return croppedImage;
}

@end
