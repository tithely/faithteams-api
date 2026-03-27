# FaithTeams API
FaithTeams API client gem for use with FaithTeams API. See [FaithTeams API Documentation](https://api.faithteams.com/docs) for more information.

## Overview and Purpose
It provides a wrapper around the FaithTeams API and includes the following collection of classes and methods for each API version that can be used to interact with the FaithTeams API:

* `FaithTeams::API::V*::Connection` - Takes FaithTeams credentials (`user_id` and `password`) and is responsible for:
    * establishing and validating a connection to the FaithTeams API
    * providing the underlying methods used by the various API resources to make specific API calls.
    * handling request errors.
* `FaithTeams::API::V*::Gateway` - Takes a `FaithTeams::Connection` and is responsible for providing a collection of API resources.
* `FaithTeams::API::V*::Resource` - Provides CRUD functionality for each resource.
* `FaithTeams::API::V*::Error::*` - All necessary errors.
* `FaithTeams::API::V*::Entity::*` - All necessary entities.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "faithteams"
```

And then execute:

`bundle install`

Or install it yourself as:

`gem install faithteams`

## VS Code Bruno Extension

We are now using the [Bruno API Client](https://docs.usebruno.com/introduction/what-is-bruno) for developing and testing 2nd party API requests. You can use a desktop app or VS Code extension to use Bruno.

### Desktop App

1. Simply follow these instructions for your desktop app [installation options](https://docs.usebruno.com/get-started/bruno-basics/download).

### VS Code Extension

1. If you don't already have it, install the VS Code Bruno Extension.
1. After opening the extension, click the + button to open a "collection".
    1. Find the root level '[second_party]-api' directory. (ie 'faithteams-api')
1. Make a copy of the .env.template file (and make sure to just call it .env) and fill in the necessary values from 1Password.
1. In the left pane, open the ... menu beside faithteams-api and select *settings*.
1. Select your desired environment to use with this collection in the upper right (most likely *FaithTeams*).
1. You should now be ready to make some API calls!
1. See Bruno's [VS Code Extension Documentation](https://docs.usebruno.com/vs-code-extension/overview) for more details.

## Contributing

### How to Contribute

1. Adhere to the [Code of Conduct](./CODE_OF_CONDUCT.md)
1. Fork the project.
1. Create a new branch for your feature: `git checkout -b feature-name`.
1. Commit your changes: `git commit -m 'Add new feature'`. Please reference a GitHub issue if applicable. See [linking a pull request to an issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue).  Please be sure to include an appropriate entry in the [CHANGELOG.md](./CHANGELOG.md).
1. Push to your branch: `git push origin feature-name`.
1. Open a pull request. Please add information about why this is necessary, citing specific examples if possible.

### Code of Conduct

This project has a [Code of Conduct](./CODE_OF_CONDUCT.md). Please read through this document and ensure compliance before contributing.

### Contributor Guidelines

Contributions should adhere to the [API Client Gateway Resource Interface](./guides/api_client_interface.md).  Additional API endpoints should be added to the Thunder Client Collection with appropriate tests included.

## Testing

To run the tests in the gem: `bundle exec rspec`

To run a specific test, use a pattern: `bundle exec rspec -P "**/contribution_spec.rb"`

Use the Thunder Client extension for VS Code to test/inspect API calls.

## Gem Publishing

General instructions for publishing a gem are available in this [RubyGems guide](https://guides.rubygems.org/publishing/#publishing-to-rubygemsorg).

Once a gem is ready to be published:
1. Create a PR to merge `master` into `production`
1. After merge, [create a release](https://github.com/tithely/faithteams-api/releases) on the `production` branch
1. The [GitHub Action](https://guides.rubygems.org/trusted-publishing/releasing-gems/) [rubygems.yml](./.github/workflows/rubygems.yml) will publish the gem to RubyGems.

## License

This project is licensed under the [MIT License](./LICENSE).

## Contact and Bug Reports

You can contact the project maintainers or file a bug report through GitHub Issues on this repository. Please provide complete details so that your question or issue may be resolved as soon as possible.

[comment]: <> (TODO: Add FaithTeams contact information)

## Project Status

This project is being actively maintained and is stable for production use.

## Tithe.ly

![Tithe.ly Logo](https://assets-global.website-files.com/5f6a31379c9e2712518b8d6c/61fbe41d8e639d18d7c516b7_Logomark.svg)

With tools like text and email messaging, custom church apps and websites, church management software, and digital giving, [Tithe.ly](https://tithe.ly/) provides the tools you need to engage with your church online, stay connected, increase generosity, and simplify the lives of your staff.
