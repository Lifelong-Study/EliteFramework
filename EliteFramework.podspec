Pod::Spec.new do |spec|

  spec.name = "EliteFramework"
  spec.version = "3.0.14"
  spec.summary = "UI and NS extended, write shortcode do more."
  spec.homepage = "https://github.com/Lifelong-Study/EliteFramework"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "SongHua" => 'songhua.develop@gmail.com' }
#  spec.social_media_url = ""

  spec.platform = :ios, "8.0"
  spec.requires_arc = true
  spec.source = { :git => "https://github.com/Lifelong-Study/EliteFramework.git", :tag => "v#{spec.version}", :branch => '3.0' }
  spec.source_files = "EliteFramework/*.{h,swift}"

end
