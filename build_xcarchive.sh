set -e
[ -e SwiftyZeroMQKit.xcframework ] && rm -r SwiftyZeroMQKit.xcframework
xcodebuild archive -scheme SwiftyZeroMQKit-iOS -sdk iphonesimulator -archivePath SwiftyZeroMQKit-iOS-iphonesimulator.xcarchive SKIP_INSTALL=NO ONLY_ACTIVE_ARCH=NO VALID_ARCHS="i386 x86_64"
xcodebuild archive -scheme SwiftyZeroMQKit-iOS -sdk iphoneos -archivePath SwiftyZeroMQKit-iOS-iphoneos.xcarchive SKIP_INSTALL=NO
xcodebuild archive -scheme SwiftyZeroMQKit-macOS -sdk macosx -archivePath SwiftyZeroMQKit-macOS-macosx.xcarchive SKIP_INSTALL=NO
xcodebuild -create-xcframework \
 -framework SwiftyZeroMQKit-iOS-iphonesimulator.xcarchive/Products/Library/Frameworks/SwiftyZeroMQKit.framework \
 -framework SwiftyZeroMQKit-iOS-iphoneos.xcarchive/Products/Library/Frameworks/SwiftyZeroMQKit.framework \
 -framework SwiftyZeroMQKit-macos-macosx.xcarchive/Products/Library/Frameworks/SwiftyZeroMQKit.framework \
 -output SwiftyZeroMQKit.xcframework
cd SwiftyZeroMQKit.xcframework
# This works around a xcode bug where swiftinterface files are generated with types like 'SwiftyZeroMQ.SwiftyZeroMQ.Socket' instead of 'SwiftyZeroMQ.Socket'
#find . -name "*.swiftinterface" -exec sed -i.backup -e 's/SwiftyZeroMQ\.SwiftyZeroMQ\./SwiftyZeroMQ\./g' {} \;
cd ..
