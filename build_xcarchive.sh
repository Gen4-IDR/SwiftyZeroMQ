set -e
[ -e SwiftyZeroMQ.xcframework ] && rm -r SwiftyZeroMQ.xcframework
xcodebuild archive -scheme SwiftyZeroMQ-iOS -sdk iphonesimulator ARCHS=i386 ONLY_ACTIVE_ARCH=NO -archivePath SwiftyZeroMQ-iOS-iphonesimulator.xcarchive SKIP_INSTALL=NO
xcodebuild archive -scheme SwiftyZeroMQ-iOS -sdk iphoneos -archivePath SwiftyZeroMQ-iOS-iphoneos.xcarchive SKIP_INSTALL=NO
xcodebuild archive -scheme SwiftyZeroMQ-macOS -sdk macosx -archivePath SwiftyZeroMQ-macOS-macosx.xcarchive SKIP_INSTALL=NO
xcodebuild -create-xcframework \
 -framework SwiftyZeroMQ-iOS-iphonesimulator.xcarchive/Products/Library/Frameworks/SwiftyZeroMQ.framework \
 -framework SwiftyZeroMQ-iOS-iphoneos.xcarchive/Products/Library/Frameworks/SwiftyZeroMQ.framework \
 -framework SwiftyZeroMQ-macos-macosx.xcarchive/Products/Library/Frameworks/SwiftyZeroMQ.framework \
 -output SwiftyZeroMQ.xcframework
cd SwiftyZeroMQ.xcframework
# This works around a xcode bug where swiftinterface files are generated with types like 'SwiftyZeroMQ.SwiftyZeroMQ.Socket' instead of 'SwiftyZeroMQ.Socket'
find . -name "*.swiftinterface" -exec sed -i -e 's/SwiftyZeroMQ\.SwiftyZeroMQ\./SwiftyZeroMQ\./g' {} \;
cd ..
