FROM mohamadassi173/jenkins_android

# install java latest
RUN yes "y" | apt install default-jdk

# Update android-sdk and install build and cmdline tools
RUN sdkmanager --sdk_root=/opt/android-sdk-linux --update
RUN sdkmanager --sdk_root=/opt/android-sdk-linux --install "cmdline-tools;latest"
RUN sdkmanager --sdk_root=/opt/android-sdk-linux --install "build-tools;31.0.0" "platforms;android-31"

# Download flutter and update PATH
ENV FLUTTER_HOME /opt/flutter
ENV PATH ${PATH}:${FLUTTER_HOME}/bin
USER root
RUN git clone -b stable https://github.com/flutter/flutter "${FLUTTER_HOME}"

# Flutter doctor
RUN yes "y" | flutter doctor --android-licenses
RUN flutter doctor -v