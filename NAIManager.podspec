
Pod::Spec.new do |s|
  s.name             = "NAIManager"
  s.version          = "1.0.0"
  s.summary          = "A Network Activity Indicator Manager for iOS."
  s.author           = { "Meniny" => "Meniny@qq.com" }
  s.homepage         = "https://github.com/Meniny/NetworkActivityIndicatorManager"
  s.social_media_url = 'https://meniny.cn/'
  s.license          = 'MIT'
  s.description      = <<-DESC
                        NAIManager is a Network Activity Indicator Manager for iOS written in Swift.
                        DESC

  s.ios.deployment_target = '7.0'

  s.source           = { :git => "https://github.com/Meniny/NetworkActivityIndicatorManager.git", :tag => s.version.to_s }
  s.source_files = 'NAIManager/Source/*'
  s.public_header_files = 'NAIManager/Source/*.h'

  s.ios.frameworks = 'Foundation', 'UIKit'

  # s.dependency ""
end
