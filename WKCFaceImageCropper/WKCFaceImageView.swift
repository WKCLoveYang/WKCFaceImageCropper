//
//  WKCFaceImageView.swift
//  SwiftFuck
//
//  Created by wkcloveYang on 2020/7/20.
//  Copyright © 2020 wkcloveYang. All rights reserved.
//

import UIKit

@objc open class WKCFaceImageView: UIImageView {
    
    /// 高/宽
    @objc public var heightWidthScale: CGFloat = 1.0
    
    /// 裁剪完成时的回调
    @objc public var imageCropedBlock: ((UIImage) -> ())?
    
    /// 裁剪入口, 设置faceImg -> 裁剪
    @objc public var faceImg: UIImage? {
        willSet {
            if let value = newValue {
                WKCFaceImageCropper.shared.cropFaceImage(image: value, heightWidthScale: heightWidthScale) {(result) in
                    self.image = result
                    
                    if let block = self.imageCropedBlock {
                        block(result)
                    }
                }
            } else {
                self.image = newValue
            }
        }
    }
    
    deinit {
        debugPrint("====== WKCFaceImageView is dealloc!!! ======")
    }
}
