FROM ruby:2.2.4
MAINTAINER eng-support-tools@digitalocean.com

# fix apt-get warnings by adding debian jessie GPG keys
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9D6D8F6BC857C906
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7638D0442B90D010

RUN apt-get update && apt-get install -y build-essential nodejs

WORKDIR .

RUN gem install bundler
COPY . ./
RUN ./bin/setup
RUN curl -L https://github.com/prometheus/pushgateway/releases/download/0.3.0/pushgateway-0.3.0.linux-386.tar.gz -o pushgateway.tar.gz
RUN tar -xvf pushgateway.tar.gz
