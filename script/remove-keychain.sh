#!/usr/bin/env bash
security delete-keychain ios-build.keychain
rm -rf ~/Library/MobileDevice/Provisioning\ Profiles/*.mobileprovision
