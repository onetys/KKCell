

Pod::Spec.new do |s|

  s.name         = "KKCell"

  s.version      = "0.0.1"

  s.summary      = "custom UICollectionViewCell : 自定义UICollectionViewCell"

  s.description  = <<-DESC
custom UICollectionViewCell : 自定义UICollectionViewCell 可扩充自定义
                   DESC

  s.homepage     = "https://github.com/TieShanWang/KKCell"

  s.license      = "MIT"

  s.author             = { "wangtieshan" => "15003836653@163.com" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/TieShanWang/KKCell.git", :tag => "0.0.1" }

  s.source_files  = "KKCell/KKCollectionViewCell/**/*.{h,m,mm}","KKCell/KKCollectionViewCell/*.{h,m,mm}"

  s.framework  = "UIKit"

 s.requires_arc = true
 
 s.dependency  "SDWebImage"

end
