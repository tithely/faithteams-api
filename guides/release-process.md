# Release Process

1. Branch off of the commit you want to release (`git checkout -b x.x.x`).
1. Update the changelog version information and make sure that all changes to be released have been documented.
1. Bump the version number in `lib/faithteams/version.rb` to the version to be released.
1. Create a PR, look for approvals and merge this in to master.
1. Tag master at the new commit with the version number (`git tag -a x.x.x`).
1. Push this tag up to origin `git push origin x.x.x`.
1. Head over to GitHub to create a [new release](https://github.com/tithely/faithteams-api/releases/new). Make sure to select the tag that you just pushed, place the version number as the release name and copy in the associated changelog contents into the description. Publish this release.
1. This will kick off a deploy action which you can watch [here](https://github.com/tithely/faithteams-api/actions?query=workflow%3A%22Ruby+Gem%22).
1. Once the action completes, verify the new version of the package is available [here](https://github.com/tithely/faithteams-api/packages).
