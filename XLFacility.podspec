# http://guides.cocoapods.org/syntax/podspec.html
# http://guides.cocoapods.org/making/getting-setup-with-trunk.html
# $ sudo gem update cocoapods
# (optional) $ pod trunk register {email} {name} --description={computer}
# $ pod trunk push
# DELETE THIS SECTION BEFORE PROCEEDING!

Pod::Spec.new do |s|
  s.name     = 'XLFacility'
  s.version  = '0.9'
  s.author   =  { 'Pierre-Olivier Latour' => 'info@pol-online.net' }
  s.license  = { :type => 'BSD', :file => 'LICENSE' }
  s.homepage = 'https://github.com/swisspol/XLFacility'
  s.summary  = 'Elegant and extensive logging facility for OS X & iOS (includes database, Telnet and HTTP servers)'
  
  s.source   = { :git => 'https://github.com/swisspol/XLFacility.git', :tag => s.version.to_s }
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
  s.requires_arc = true
  
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |cs|
    cs.source_files = 'XLFacility/Core/*.{h,m}'
    cs.private_header_files = "XLFacility/Core/XLPrivate.h"
    cs.requires_arc = true
  end
  
  s.subspec 'Extensions' do |cs|
    cs.dependency 'XLFacility/Core'
    cs.source_files = 'XLFacility/Extensions/*.{h,m}'
    cs.requires_arc = true
    cs.ios.library = 'sqlite3'
    cs.ios.frameworks = 'CFNetwork'
    cs.osx.library = 'sqlite3'
    cs.osx.framework = 'CFNetwork'
  end

  s.subspec 'UserInterface' do |cs|
    cs.dependency 'XLFacility/Core'
    cs.source_files = 'XLFacility/UserInterface/*.{h,m}'
    cs.osx.exclude_files = 'XLFacility/UserInterface/XLUIKitOverlayLogger.{h,m}'
    cs.requires_arc = true
  end
  
end