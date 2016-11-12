

Pod::Spec.new do |s|

  s.name         = "KKCell"

  s.version      = "0.2.0"

  s.summary      = "custom UICollectionViewCell : 自定义UICollectionViewCell"

  s.description  = <<-DESC
custom UICollectionViewCell : 自定义UICollectionViewCell 可扩充自定义
                   DESC

  s.homepage     = "https://github.com/TieShanWang/KKCell"

  s.license      = "MIT"

  s.author             = { "wangtieshan" => "15003836653@163.com" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/TieShanWang/KKCell.git", :tag => "0.2.0" }

  s.source_files  = "KKCell/KKCollectionViewCell/KKCollectionViewCell.{h,m,mm}"

  s.framework  = "UIKit"

 s.requires_arc = true

 s.subspec 'KKTextCell' do tcs
    tcs.source_files  = "KKCell/KKCollectionViewCell/KKCollectionViewCell.{h,m,mm}","KKCell/KKCollectionViewCell/KKTextCell.{h,m,mm}","KKCell/KKCollectionViewCell/KKCellProtocol.{h,m,mm}"
    s.framework  = "UIKit"
end
s.subspec 'KKImageCell' do ics
ics.source_files  = "KKCell/KKCollectionViewCell/KKCollectionViewCell.{h,m,mm}","KKCell/KKCollectionViewCell/KKImageCell.{h,m,mm}","KKCell/KKCollectionViewCell/KKCellProtocol.{h,m,mm}"
 s.framework  = "UIKit"
 ics.dependency  "SDWebImage"
end

end
