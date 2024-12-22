#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_launch_arguments.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_launch_arguments'
  s.version          = '1.0.0'
  s.summary          = 'A flutter plugin to retrieve Android and iOS launch arguments'
  s.description      = <<-DESC
A flutter plugin to retrieve Android and iOS launch arguments
                       DESC
  s.homepage         = 'https://mylittlesuite.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'MyLittleSuite' => 'info@mylittlesuite.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'flutter_launch_arguments_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
end
