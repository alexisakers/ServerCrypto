#!/bin/bash
set -e

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
	
	echo "👉  Building with SPM in Debug mode"
	swift package clean
    swift build -Xswiftc -I/usr/local/opt/openssl/include -Xlinker -L/usr/local/opt/openssl/lib
	
    echo "👉  Building with SPM in Release mode"
    swift package clean
	swift build -c release -Xswiftc -I/usr/local/opt/openssl/include -Xlinker -L/usr/local/opt/openssl/lib
	
	echo "👉  Testing with Xcode"
	xcodebuild clean test -project ServerCrypto.xcodeproj -scheme ServerCrypto | xcpretty
	
    echo "👉  Testing with SPM"
	swift package clean
    swift test -Xswiftc -I/usr/local/opt/openssl/include -Xlinker -L/usr/local/opt/openssl/lib

    echo "✅  Done"

fi

if [[ $TRAVIS_OS_NAME == 'linux' ]]; then

    echo "👉  Building with SPM in Debug mode"
	swift package clean
	swift build

	echo "👉  Building with SPM in Release mode"
	swift package clean
    swift build -c release
	
	echo "👉  Testing with SPM"
	swift package clean
	swift test

    echo "✅  Done"

fi
