# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## 2.0.0 - 2021-03-01
### Changed
- Rebuild Docker image using shinesolutions/the-works-buildenv 1.3.0
- Update PIP to 21.0.1

## 1.7.1 - 2020-11-27
### Changed
- Upgrade Puppet to 5.5.22

## 1.7.0 - 2020-09-27
### Changed
- Switch aem-platform-buildenv source to shinesolutions/the-works-buildenv
- Upgrade Puppet to 5.5.21

### Removed
- Remove sandpit and publisher Docker images

## 1.6.0 - 2020-02-13
### Changed
- Upgrade rtk to 1.0.0
- Upgrade python3.4 to python3.6 (AWS CDK requires 3.6 or higher)
- Rename Python Virtualenv aliases to py2 and py3

## 1.4.0 - 2020-01-26
### Added
- Add python3.4 and python2.7 virtualenvs on base image

### Changed
- Upgrade Puppet to 5.5.18
- Replace latest Puppet installation with specific version

## 1.3.0 - 2020-01-05
### Changed
- Upgrade Ansible to 2.9.2
- Upgrade AWS CLI to 1.16.304
- Upgrade Packer to 1.5.1

## 1.2.0 - 2019-12-31
### Added
- Add github-release-downloader(grd) for downloading private GitHub repos using OAuth token

### Changed
- Specify local source for docker_image publishing due to Ansible dropping auto-detection

## 1.1.0 - 2019-08-16
### Changed
- Upgrade Ansible to 2.8.2
- Disable PDK analytics collection

### Fixed
- Fix docker version tag for publisher and sandpit

## 1.0.0 - 2019-07-01
### Added
- Add ECR repository support [#4]
- Parameterise timezone

### Changed
- Use Makefile version as release version source of truth

## 0.11.0 - 2019-05-26
### Changed
- Upgrade rtk to 0.2.0
- Upgrade node.js to 10.15.3
- Upgrade Ansible to 2.7.10
- Upgrade AWS CLI to 1.16.115
- Cleanup previous gnupg before provisioning new one on publisher image
- Replace aem-platform-buildenv-publisher source to be aem-platform-buildenv

## 0.10.0 - 2019-05-09
### Added
- Add node packages: nestor and putasset

## 0.9.0 - 2019-03-12
### Added
- Initial version
