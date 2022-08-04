FROM --platform=linux/x86_64 mysql:8.0.23

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29 \
  && apt-get update \
  && apt-get install -y curl locales \
  && locale-gen ja_JP.UTF-8 \
  && localedef -f UTF-8 -i ja_JP ja_JP
USER mysql
ENV LANG ja_JP.UTF-8
ENV TZ Asia/Tokyo
# CMD ["bash", "mysql.sh"]