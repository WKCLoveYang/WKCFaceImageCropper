//
//  UIImage+Extension.swift
//  SwiftFuck
//
//  Created by wkcloveYang on 2020/7/20.
//  Copyright © 2020 wkcloveYang. All rights reserved.
//

import UIKit

extension UIImage {
    /// 图片压缩
    /// - Parameter complete: 回调
    public func imageCompressed(complete: @escaping (UIImage) -> ()) {
        DispatchQueue.global().async {
            let finallImageData = self.jpegData(compressionQuality: 1.0);
            let sizeOrigin   = finallImageData!.count;
            let sizeOriginKB: CGFloat = CGFloat(sizeOrigin / 1000);
            let maxSize: CGFloat = 1024 * UIScreen.main.scale;
        
            var resizeImage: UIImage?
            if (sizeOriginKB >= maxSize) {
                let scale = CGFloat(sizeOriginKB / maxSize)
                let newSize = CGSize(width: self.size.width / scale, height: self.size.height / scale)
                resizeImage = self.resized(at: newSize)
            } else {
                resizeImage = self;
            }
            DispatchQueue.main.async {
                complete(resizeImage!)
            }
        }
    }
    
    /// 重置size
    /// - Parameter size: newSize
    /// - Returns: 重置后的图片
    public func resized(at size: CGSize) -> UIImage {
        var actualHeight = self.size.height
        var actualWidth = self.size.width
        
        var oldRatio = actualWidth / actualHeight
        let newRatio = size.width / size.height
        
        if (oldRatio < newRatio) {
            oldRatio = size.height / actualHeight;
            actualWidth = oldRatio * actualWidth;
            actualHeight = size.height;
        }
        else {
            oldRatio = size.width / actualWidth;
            actualHeight = oldRatio * actualHeight;
            actualWidth = size.width;
        }
        
        let rect = CGRect(x: 0, y: 0, width: actualWidth, height: actualHeight)
        UIGraphicsBeginImageContext(rect.size)
        self.draw(in: rect)
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        
        return result!
    }
    
    /// 裁剪
    /// - Parameter rect: newRect
    /// - Returns: 裁剪后的图片
    public func cropped(at rect: CGRect) -> UIImage {
        let origin: CGPoint = CGPoint(x: -rect.origin.x, y: -rect.origin.y)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, self.scale)
        self.draw(at: origin)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img!
    }
}
