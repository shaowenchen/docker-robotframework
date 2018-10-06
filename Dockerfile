FROM centos:7

# 安装 Chrome
ADD ./google-chrome.repo /etc/yum.repos.d/google-chrome.repo
RUN yum -y install epel-release
RUN yum -y install wget unzip bzip2 python-pip google-chrome-stable
RUN google-chrome -version

# 安装 ChromeDriver
RUN cd /tmp
RUN wget https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/bin/

# 安装 Phantomjs 2.1.1
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN bzip2 -cd phantomjs-2.1.1-linux-x86_64.tar.bz2 | tar xvf -
RUN mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin/

# 安装 Firefox
RUN yum -y install Xvfb  libXfont  lrzsz Xorg firefox

# 安装 GeckoDriver
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.23.0/geckodriver-v0.23.0-linux64.tar.gz
RUN tar zxvf geckodriver-v0.23.0-linux64.tar.gz
RUN mv geckodriver /usr/bin/

# 安装依赖包
RUN  mkdir /data
RUN  pip install -U pip
RUN  pip install -U setuptools
ADD ./requirements_base.txt /data/requirements_base.txt
RUN cd  /data
RUN chmod 777 /data
RUN  pip install -r /data/requirements_base.txt

# 安装中文字体
RUN yum -y install cjkuni-ukai-fonts cjkuni-uming-fonts wqy-zenhei-fonts

# 清理文件
RUN rm -rf /tmp/*

WORKDIR /data
