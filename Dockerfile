FROM mohamadassi173/jenkins_android

RUN sdkmanager --sdk_root=/opt/android-sdk-linux --update
RUN sdkmanager --sdk_root=/opt/android-sdk-linux --install "cmdline-tools;latest"
RUN sdkmanager --sdk_root=/opt/android-sdk-linux --install "build-tools;31.0.0" "platforms;android-31"

ENV FLUTTER_HOME /opt/flutter
ENV PATH ${PATH}:${FLUTTER_HOME}/bin
USER root
RUN git clone -b stable https://github.com/flutter/flutter "${FLUTTER_HOME}"

RUN flutter config  --no-analytics
RUN flutter precache
RUN yes "y" | flutter doctor --android-licenses
RUN flutter doctor -v
RUN flutter upgrade

RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

RUN curl -sL bit.ly/ralf_dcs -o ./dcs && \
    chmod 755 dcs && \
    mv dcs /usr/local/bin/dcs
    
# install java latest
RUN yes "y" | apt install default-jdk
