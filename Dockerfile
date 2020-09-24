FROM simdan/swift-swiftlint-ruby-pronto:latest

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
