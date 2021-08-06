xcodebuild archive -scheme SwiftyZeroMQ-iOS -sdk iphonesimulator -archivePath SwiftyZeroMQ-iOS-iphonesimulator.xcarchive SKIP_INSTALL=NO
xcodebuild archive -scheme SwiftyZeroMQ-iOS -sdk iphoneos -archivePath SwiftyZeroMQ-iOS-iphoneos.xcarchive SKIP_INSTALL=NO
xcodebuild archive -scheme SwiftyZeroMQ-macOS -sdk macosx -archivePath SwiftyZeroMQ-macOS-macosx.xcarchive SKIP_INSTALL=NO
xcodebuild -create-xcframework \
 -framework SwiftyZeroMQ-iOS-iphonesimulator.xcarchive/Products/Library/Frameworks/SwiftyZeroMQ.framework \
 -framework SwiftyZeroMQ-iOS-iphoneos.xcarchive/Products/Library/Frameworks/SwiftyZeroMQ.framework \
  -framework SwiftyZeroMQ-macos-macosx.xcarchive/Products/Library/Frameworks/SwiftyZeroMQ.framework \
 -output SwiftyZeroMQ.xcframework
