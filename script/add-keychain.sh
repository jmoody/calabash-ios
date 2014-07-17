#!/usr/bin/env bash
security create-keychain -p travis ios-build.keychain
security import ./script/apple.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./script/dev.cer   -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./script/dev.p12   -k ~/Library/Keychains/ios-build.keychain -P $DEV_P12_PASSWORD
