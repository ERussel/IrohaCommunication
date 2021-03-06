#
# Be sure to run `pod lib lint IrohaCommunication.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IrohaCommunication'
  s.version          = '0.1.0'
  s.summary          = 'Helper classes to use for communication with Iroha blockchain.'

  s.homepage         = 'https://github.com/Russel/IrohaCommunication'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Russel' => 'emkil.russel@gmail.com' }
  s.source           = { :git => 'https://github.com/Russel/IrohaCommunication.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.requires_arc = 'IrohaCommunication/Classes/**/*'
  s.source_files = 'IrohaCommunication/Classes/**/*', 'ProtoGen/*.{h,m}'

  s.dependency 'IrohaCrypto', '= 0.1.0'
  s.dependency 'gRPC-ProtoRPC', '= 1.11.0'
  s.dependency 'Protobuf', '~> 3.5.0'

  s.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1' }

end
