Pod::Spec.new do |spec|
  spec.name         = "EliteFramework"
  spec.version      = "1.0.0"
  spec.summary      = "UI and NS extended, write shortcode do more."
  spec.homepage     = "https://github.com/Lifelong-Study/EliteFramework"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.authors      = { "SongHua" => 'songhua.develop@gmail.com' }
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/Lifelong-Study/EliteFramework.git", :tag => "v#{spec.version}", :branch => "1.0" }
  spec.source_files = "$(SDKROOT)/**/*.{h,m}"
  spec.xcconfig     = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/**/" }
end