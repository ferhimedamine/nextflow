#!/usr/bin/env bash
if [[ ! $TEST_JDK ]]; then
    echo Test Java version not specified -- Skip custom Java install
    exit 0
fi

wget -q https://raw.githubusercontent.com/sormuras/bach/master/install-jdk.sh
# temporary path -- see https://github.com/sormuras/bach/issues/51#issuecomment-487380743
sed -i 's@https://download.java.net/java@https://download.oracle.com/java@g' install-jdk.sh
export JAVA_HOME=$HOME/jdk-$TEST_JDK
chmod +x install-jdk.sh
source ./install-jdk.sh -f $TEST_JDK -c --target $JAVA_HOME || ( echo Failed to configure Java $TEST_JDK && exit 1 )