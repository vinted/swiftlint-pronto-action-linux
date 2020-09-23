FROM zaimramlan/swift-swiftlint-ruby:latest

RUN apt-get -y update && apt-get install -y openssl curl git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev libssl-dev cmake
RUN gem install pronto pronto-swiftlint

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
