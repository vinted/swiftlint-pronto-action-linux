# Swiftlint pronto action linux

This action runs swiftlint via pronto on pull requests.

## Usage

```yaml
name: PR lint

on:
  pull_request:
    paths:
      - ".swiftlint.yml"
      - "**/*.swift"

jobs:
  SwiftLint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: simdani/action-swiftlint-linux@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          GITHUB_REPOSITORY: ${{ github.repository }}
          GITHUB_PULL_REQUEST_ID: ${{ github.event.number }}
          DIFF_BASE: ${{ github.base_ref }}
```

## Inputs

- GITHUB_TOKEN - github api token
- GITHUB_REPOSITORY - github current repository
- GITHUB_PULL_REQUEST_ID - current pull request id

## License

[MIT](LICENSE)
