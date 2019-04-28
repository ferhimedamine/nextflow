#!/usr/bin/env bash
if [[ ! $TEST_JDK ]]; then
    echo Test Java version not specified -- Skip custom Java install
    exit 0
fi

if [[ $TRAVIS == true ]]; then
    export JAVA_HOME=$HOME/openjdk$TEST_JDK
    $TRAVIS_BUILD_DIR/install-jdk.sh --install openjdk$TEST_JDK --target $JAVA_HOME || ( echo Failed to configure Java $TEST_JDK && exit 1 )

elif [[ $CIRCLECI == true ]]; then
      wget -q https://raw.githubusercontent.com/sormuras/bach/master/install-jdk.sh
      chmod +x install-jdk.sh
      source ./install-jdk.sh -f $TEST_JDK -c || ( echo Failed to configure Java $TEST_JDK && exit 1 )
fi