# WKCFaceImageCropper
图片人脸优化显示, 并依据人脸及所需比例对图片进行裁剪


[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) [![CocoaPods compatible](https://img.shields.io/cocoapods/v/WKCFaceImageCropper?style=flat)](https://cocoapods.org/pods/WKCFaceImageCropper) [![License: MIT](https://img.shields.io/cocoapods/l/WKCFaceImageCropper?style=flat)](http://opensource.org/licenses/MIT)

1. 直接裁剪图片.
```
WKCFaceImageCropper.shared.cropFaceImage(image: img,
                                         heightWidthScale: 1) { (result) in
                                            imgView.image = result
}
```

2. 只用WKCFaceImageView, 继承自UIImageView. 设置高宽比后, 赋值faceImg即可.
```
imageView.heightWidthScale = 1
imageView.faceImg = image
```

| 图片 | 含义 |
| ---- | ---- |
| <p align="center">
<img src="https://github.com/WKCLoveYang/WKCFaceImageCropper/raw/master/source/1.png" width="50">
</p> |  原图 |
