Pod::Spec.new do |spec|

  spec.name = "EliteFramework"
  #swift_version = spec.swift_version.to_s
  #spec.build_settings['SWIFT_VERSION'] = '5.0'
  spec.swift_versions = ['1.0']

  spec.version = "1.0.0"
  spec.summary = "UI and NS extended, write shortcode do more."
  spec.homepage = "https://github.com/Lifelong-Study/EliteFramework"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "SongHua" => 'songhua.develop@gmail.com' }
#  spec.social_media_url = ""

  spec.platform = :ios, "9.0"
  spec.requires_arc = true
  spec.source = { :git => "https://github.com/Lifelong-Study/EliteFramework.git", :tag => "v#{spec.version}", :branch => '5.0' }
  spec.source_files = "EliteFramework/*.{h,swift}"
end
