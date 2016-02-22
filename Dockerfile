FROM bitriseio/docker-android:latest

# ------------------------------------------------------
# --- Install required tools

RUN apt-get update -qq
# ------------------------------------------------------
# --- Install Android SDKs and other build packages
# Android System Images, for emulators
# Please keep these in descending order!
RUN echo y | android update sdk --no-ui --all --filter \
  sys-img-armeabi-v7a-android-23,sys-img-armeabi-v7a-android-22,sys-img-armeabi-v7a-android-21,sys-img-armeabi-v7a-android-19,sys-img-armeabi-v7a-android-17,sys-img-armeabi-v7a-android-16,sys-img-armeabi-v7a-android-15

# Extras
RUN echo y | android update sdk --no-ui --all --filter \
  extra-android-m2repository,extra-android-support,extra-google-m2repository,extra-google-google_play_services,extra-intel-Hardware_Accelerated_Execution_Manager



# ------------------------------------------------------
# --- Install NodeJS and NPM3
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN node --version
RUN npm install -g npm3
RUN npm --version


# ------------------------------------------------------
# --- React Native CLI
RUN npm install -g react-native-cli
RUN react-native --version

# ------------------------------------------------------
# --- Cleanup and rev num

# Cleaning
RUN apt-get clean

ENV BITRISE_DOCKER_REV_NUMBER_ANDROID 2016_01_09_1
CMD bitrise -version
