FROM ubuntu:14.04

RUN apt-get update -qq && apt-get install -y build-essential chrpath libssl-dev libxft-dev wget

RUN apt-get install -y curl git

RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -

RUN apt-get install -y nodejs

RUN npm install -g ember-cli

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN apt-get install libfreetype6 libfreetype6-dev
RUN apt-get install libfontconfig1 libfontconfig1-dev

RUN cd ~
RUN export PHANTOM_JS="phantomjs-1.9.8-linux-x86_64"
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
RUN tar xvjf $PHANTOM_JS.tar.bz2

RUN mv $PHANTOM_JS /usr/local/share
RUN ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
