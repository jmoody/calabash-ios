#!/usr/bin/env bash
security create-keychain -p travis ios-build.keychain
security import ./scripts/travis/apple.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./scripts/travis/dev.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./scripts/travis/dev.p12 -k ~/Library/Keychains/ios-build.keychain -P $DEV_P12_PASSWORD
