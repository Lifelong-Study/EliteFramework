Pod::Spec.new do |spec|

  spec.name = "EliteFramework"
  spec.version = "2.3.0"
  spec.summary = "UI and NS extended, use shortcode do more."
  spec.homepage = "https://github.com/Lifelong-Study/EliteFramework"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "SongHua" => 'songhua.develop@gmail.com' }
#  spec.social_media_url = ""

  spec.platform = :ios, "9.0"
  spec.requires_arc = true
  spec.source = { :git => "https://github.com/Lifelong-Study/EliteFramework.git", :tag => "v#{spec.version}" }
  spec.source_files = "EliteFramework/*.{h,swift}"

end