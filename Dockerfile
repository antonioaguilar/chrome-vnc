FROM node:slim
ENV USER root
ENV DISPLAY ":1"
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -f -y \
    net-tools \
    nano \
    htop \
    vim \
    curl \
    grep \
    less \
    xvfb \
    xterm \
    i3-wm \
    openjdk-7-jre && \
    curl --progress-bar -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg --unpack google-chrome-stable_current_amd64.deb && \
    apt-get install -f -y && \
    npm config set registry http://registry.npmjs.org/ && \
    npm install -g \
    protractor \
    jasmine && \
    webdriver-manager update && \
    rm google-chrome-stable_current_amd64.deb && \
    mkdir /main
RUN wget -q -O /tmp/tigervnc-1.7.0.x86_64.tar.gz https://bintray.com/tigervnc/stable/download_file?file_path=tigervnc-1.7.0.x86_64.tar.gz && \
    cd /tmp && tar -xf tigervnc-1.7.0.x86_64.tar.gz && cp -R tigervnc-1.7.0.x86_64/* /
RUN echo "password\npassword\nn\n" | vncpasswd
RUN touch /root/.Xresources
ADD xstartup.sh /root/.vnc/xstartup
ADD config.sh /root/.i3/config
ADD bashrc.sh /root/.bashrc
ADD script.sh /script.sh
WORKDIR /main
ENTRYPOINT ["/script.sh"]
