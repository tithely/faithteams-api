# AGENTS.md — faithteams-api

## What this is
Ruby client gem for the **FaithTeams** API — used by Tithely's ChMS integration repos to talk to FaithTeams.

## Develop
- Standard Bundler gem workflow: `bundle install`.
- Run tests with `bundle exec rspec`; lint with the repo's Rubocop (confirm exact tasks from the Rakefile / README / .github workflows).
- Bump the gem version and update the changelog when releasing; consumers pin versions.

## Conventions
- Shared client library: keep the public API backwards-compatible; breaking changes need a major version bump plus a migration note in the PR.
- Match the existing module/class structure and error-handling patterns.
- Cover new API resources/methods with specs; stub HTTP so tests make no live API calls.

## Don't
- Don't commit API keys or credentials; tests must not hit the live FaithTeams API.
- Don't break the public interface without a version bump.

## Branching & PRs
Cut feature branches from `master`; open PRs back to `master`.
