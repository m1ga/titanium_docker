# Appcelerator Titanium Dockerfile


FROM ubuntu:18.04
MAINTAINER Michael Gangolf <miga@migaweb.de>

# Install packages
RUN apt-get update

# Install OpenJDK-11
RUN apt-get install -y openjdk-11-jdk-headless
RUN apt-get clean;

# Set Java Home to JDK6
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN export JAVA_HOME

# Install packages
RUN \
	dpkg --add-architecture i386 && \
	apt-get -y install wget curl git unzip gperf nano

# Nodejs

RUN curl -sL https://deb.nodesource.com/setup_14.x  | bash -
RUN apt-get -y install nodejs
RUN npm install

# Android SDK
ENV SDK_URL="https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip" \
    ANDROID_HOME="/usr/local/android-sdk" \
    ANDROID_VERSION=29 \
    ANDROID_BUILD_TOOLS_VERSION=28.0.3

RUN mkdir "$ANDROID_HOME" .android \
    && cd "$ANDROID_HOME" \
    && mkdir cmdline-tools && cd cmdline-tools \
    && curl -o sdk.zip $SDK_URL \
    && unzip sdk.zip \
    && rm sdk.zip \
    && mv cmdline-tools latest

RUN $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --update
RUN yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "extras;android;m2repository" "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" "platforms;android-${ANDROID_VERSION}" "platform-tools"
RUN yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --licenses


# Install Titanium SDK and Alloy
RUN npm install -g titanium alloy appcelerator
RUN ti sdk install latest


# Configure Android SDK/NDK path in Titanium CLI
RUN titanium config android.sdk $ANDROID_HOME

WORKDIR /root/
