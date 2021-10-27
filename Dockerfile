FROM swift:5.5

# Install Git 2.28.0 (for GitHub Actions to locally clone repository)
ENV GIT_REVISION="git-2.28.0"
RUN apt-get remove -y git && \
    apt-get update && \
    apt-get install -y wget && \
    apt-get install -y bsdtar && \
    apt-get install -y curl && \
    apt-get install -y tcl-dev && \
    apt-get install -y gettext && \
    apt-get install -y libcurl4 libcurl4-openssl-dev && \
    apt-get install -y git

# Install Ruby & Bundler
ENV RUBY_REVISION="1:2.5.1"
ENV BUNDLER_REVISION="2.1.4"
RUN apt-get install -y ruby-full=$RUBY_REVISION && \
    gem install bundler:$BUNDLER_REVISION

# Swiftlint
RUN wget -qO- https://github.com/realm/SwiftLint/releases/download/0.45.0/swiftlint_linux.zip | bsdtar -xvf-
RUN chmod +x swiftlint
RUN mv swiftlint bin

# Install pronto gem
RUN apt-get -y update && apt-get install -y openssl curl git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev libssl-dev cmake
RUN gem install pronto pronto-swiftlint

# Verify Installation & Version
RUN swiftlint version && \
    git version && \
    ruby --version && \
    bundler --version

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
