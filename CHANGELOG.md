<!-- markdownlint-disable MD024 -->

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.1] - 2024-04-03

### Changed

1. Published to RubyGems. (IN-2229)

## [1.1.0] - 2023-11-01

### Changed

1. Rename faithteams-gem to faithteams-api. (IN-2274)

## [1.0.1] - 2023-10-30

### Fixed

1. Fix missing info in code of conduct. (IN-2274)

## [1.0.0] - 2023-10-27

### Changed

1. Prep for publishing publicly. (IN-2274)

## [0.4.1] - 2023-08-31

### Fixed

1. Skip deleted batches when doing a `Batch#find_by_batch`.

## [0.4.0] - 2023-08-29

### Added

1. Add `Resource::ContributionType#find`. (IN-2192)
1. Split `Connection#request`` into two separate methods: 1) returns the response and 2) makes the request and parses the response. (IN-2192)
1. Remove duplicate `Connection#authenticate`` in favor of `Resource::User#authenticate`. (IN-2192)
1. `Deposit#search` now takes any parameter that can be sent to the API. (IN-2192)
1. `Funds#search` now takes any parameter that can be sent to the API. (IN-2192)
1. Import and build out ThunderClient tests. (IN-2192)

## [0.3.0] - 2023-06-12

### Added

1. Add contribution type resource and entity. (IN-2108)
1. Added header? and detail? predicates on ContributionRecords. (IN-2108)

## [0.2.0] - 2023-06-01

### Changed

1. Use activesupport 7.0.5. (IN-2109)

## [0.1.0] - 2023-05-24

### Added

1. Add faithteams api v2 functionality (IN-2110)

<!-- markdownlint-enable MD024 -->
