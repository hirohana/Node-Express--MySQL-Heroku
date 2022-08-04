FROM --platform=linux/x86_64 node:16.15.0

RUN apt-get update \ 
  && apt-get install -y locales \
  && locale-gen ja_JP.UTF-8 \
  && localedef -f UTF-8 -i ja_JP ja_JP
ENV LANG ja_JP.UTF-8
ENV TZ Asia/Tokyo
WORKDIR /back
