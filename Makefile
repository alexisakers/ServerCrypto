build-mac:
	@echo "👉  Building with Xcode"
	xcodebuild clean build -project ServerCrypto.xcodeproj -scheme ServerCrypto | xcpretty
	swift package clean
	@echo "👉  Building with SPM in Debug mode"
	swift build -Xswiftc -I/usr/local/opt/openssl/include -Xlinker -L/usr/local/opt/openssl/lib
	@echo "👉  Building with SPM in Release mode"
	swift package clean
	swift build -c release -Xswiftc -I/usr/local/opt/openssl/include -Xlinker -L/usr/local/opt/openssl/lib
	@echo "✅  Done"

test-mac:
	@echo "👉  Testing with Xcode"
	xcodebuild clean test -project ServerCrypto.xcodeproj -scheme ServerCrypto | xcpretty
	swift package clean
	@echo "👉  Testing with SPM"
	swift test -Xswiftc -I/usr/local/opt/openssl/include -Xlinker -L/usr/local/opt/openssl/lib
	@echo "✅  Done"

build-linux:
	swift package clean
	@echo "👉  Building with SPM in Debug mode"
	swift build
	@echo "👉  Building with SPM in Release mode"
	swift package clean
	swift build -c release
	@echo "✅  Done"

test-linux:
	@echo "👉  Testing with SPM"
	swift package clean
	swift test
	@echo "✅  Done"