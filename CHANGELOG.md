# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### :sparkles: Added 

- New features go here

### :pencil2: Changed

- Changes in existing functionality go here

### :warning: Deprecated

 - Soon-to-be removed features go here

### :no_entry_sign: Removed

  - Now removed features go here

### :wrench: Fixed

   - Bug fixes go here

## [2.0.2] - 2024-06-25

### :pencil2: Changed

- Adds aws_cdk.aws-lambda-python-alpha as a dependency

### :wrench: Fixed

   - Fixes `stack-pattern` argument

## [2.0.0] - 2024-06-10

### :pencil2: Changed

- Changes `stack-id` to `stack-pattern`

### :no_entry_sign: Removed

  - Removes `bootstrap` input
  - Removes `add-branch-suffix` argument in favour of using `BranchScopedStack`

## [1.3.0] - 2024-06-04

### :sparkles: Added

- Adds support for bootstrapping account before deployment through the `boostrap` input

## [1.2.0] - 2024-06-04

### :sparkles: Added

- Adds support for passing custom app path through the `app-file` input
- Adds cdk-nag and identity pool alpha as dependencies

### :pencil2: Changed

- Bumps CDK dependency versions

## [1.1.0] - 2023-10-10

### :sparkles: Added 

- Adds support for passing CfnParameter values to CDK through the `parameters` input

## [1.0.0] - 2023-10-04

### :sparkles: Added

 - Adds initial deploy-aws-cdk-stack Action
 - Adds support for branch scoped deployments
 - Adds support for ephemeral deployments
 - Adds README
 - Adds LICENSE
 - Adds CHANGELOG
