<!-- markdownlint-disable MD024 -->

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [4.2.0] - 2025-02-18

### Changed

1. Update ActiveSupport Version to support Rails 7.2.2.1. (IN-2565)

## [4.1.1] - 2024-12-19

### Added

1. Adds `Entity::Fund` `active?` and `default?` interrogatives

## [4.0.1] - 2024-09-16

This version adds support for Ruby 3.3.5. No real changes were required. We just needed to add some gems to the gemspec
to silence deprecation warnings.

### Added

1. Add dependencies which will be removed from a future version of Ruby. (IN-2512)

## [4.0.0] - 2024-09-11

### Changed

1. Update ActiveSupport Version to support Rails 7. (IN-2109)

## [3.0.1] - 2024-09-09

### Changed

1. Update dependencies to address security warnings. (IN-2494)

## [3.0.0] - 2024-05-21 - https://github.com/tithely/faithteams-api/pull/8

### Fixed

1. Use basic auth for all API requests and remove User. (IN-2429)

### Removed

1. Remove `Resource::User` and `Resource::User#authenticate`. (IN-2429)

## [2.0.2] - 2024-04-04 - https://github.com/tithely/faithteams-api/pull/5

### Fixed

1. Fixed gemspec metadata urls. (IN-2229)
1. Update gem dependencies.
1. Replace `jeweler.yml` Github Action with `rubygems.yml`.

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
