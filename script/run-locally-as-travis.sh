#!/usr/bin/env bash

# a script for running travis ci scripts local
# XTC_API_TOKEN=`cat ~/.xamarin/test-cloud/moody | tr -d '\n'` XTC_DEVICE_SET='<device set>' ./script/run-locally-as-travis.sh

export TRAVIS=1

#./script/rspec-ci
#./script/unit-ci
#./script/cucumber-ci
./script/xtc-submit-ci
