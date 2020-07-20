Pod::Spec.new do |s|
s.name         = "WKCFaceImageCropper"
s.version      = "0.1.2"
s.summary      = "图片人脸优化显示, 并依据人脸及所需比例对图片进行裁剪"
s.homepage     = "https://github.com/WKCLoveYang/WKCFaceImageCropper.git"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "WKCLoveYang" => "wkcloveyang@gmail.com" }
s.platform     = :ios, "11.0"
s.source       = { :git => "https://github.com/WKCLoveYang/WKCFaceImageCropper.git", :tag => "0.1.2" }
s.source_files  = "WKCFaceImageCropper/**/*.swift"
s.requires_arc = true
s.frameworks = "Vision"
s.swift_version = "5.0"

end
