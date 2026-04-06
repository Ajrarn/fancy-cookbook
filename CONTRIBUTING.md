# Branches
Unlike other projects, the main branch is not the production one.
When I have to add a version to Typst package, I have to add another directory with the version number.
I don't want to do that here, but I will do something that echoes to this organization.
So the main branch is for dev and for each version in production, there will be a branch.

In any case: hotfix, a new branch will be created from the actual production branch, and the modifications will be made on it and reported in the main branch.
For the new features, the main branch will be used, until we create a new version.

# Semver

I want to apply the Semantic version. So for breaking changes, we update the first digit, for new features, the second and fort hotfix the last one.


# Pull Request

If you want to suggest some features, please try to address your PR with the "main" branch for features, or in a feature branch, I like it too.
And a new version branch for your fix.