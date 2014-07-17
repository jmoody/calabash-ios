#!/usr/bin/env bash
security create-keychain -p travis ios-build.keychain
security default-keychain -s ios-build.keychain
security unlock-keychain -p travis ios-build.keychain
security -v set-keychain-settings -lut 86400 ios-build.keychain
security import ./script/apple.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./script/dev.cer   -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./script/dev.p12   -k ~/Library/Keychains/ios-build.keychain -P $DEV_P12_PASSWORD
open "${TRAVIS_PROVISIONING_PROFILE}"
