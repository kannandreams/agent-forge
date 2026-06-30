# Release Tools

This folder contains release tooling for versioning, changelogs, and shipping.

## Tools

- `changelog.sh` — generate a changelog from git tags and merge commits
  following the release-management skill output patterns.

## Usage

```bash
# Changelog since last tagged version
./tools/release/changelog.sh

# Changelog for a specific version range
./tools/release/changelog.sh --since v1.0.0 --until v1.2.0

# Write to file
./tools/release/changelog.sh --output CHANGELOG.md
```
