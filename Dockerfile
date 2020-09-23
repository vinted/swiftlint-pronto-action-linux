FROM norionomura/swiftlint:swift-5.1
LABEL version="1.0.0"

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
