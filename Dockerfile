FROM windsekirun/jenkins-android-docker:1.1.4

RUN sdkmanager --sdk_root=/opt/android-sdk-linux --update
RUN sdkmanager --sdk_root=/opt/android-sdk-linux --install "cmdline-tools;latest"
RUN sdkmanager --sdk_root=/opt/android-sdk-linux --install "build-tools;31.0.0" "platforms;android-31"

ENV FLUTTER_HOME /opt/flutter
ENV PATH ${PATH}:${FLUTTER_HOME}/bin
USER root
RUN git clone -b stable https://github.com/flutter/flutter "${FLUTTER_HOME}"

RUN yes "y" | flutter doctor --android-licenses
## flutter doctor 실행
RUN flutter doctor -v
## flutter upgrade 실행
RUN flutter upgrade
