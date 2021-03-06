# skydive

#### Table of Contents

1. [Description](#description)
1. [Setup](#setup)
    * [What skydive affects](#what-skydive-affects)
    * [Beginning with skydive](#beginning-with-skydive)
1. [Requirements](#requirements)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module sets up [Skydive](https://github.com/skydive-project/skydive), an open source real-time network topology and protocols analyzer.

## Setup

## Requirements

This module relies on hiera in order to manage the common settings in the skydive class.

* hiera
* [concat](https://github.com/puppetlabs/puppetlabs-concat) <= 2.2.1
* [stdlib](https://github.com/puppetlabs/puppetlabs-stdlib) <= 4.7.1
* [archive](https://github.com/voxpupuli/puppet-archive.git) <= 1.2.0

### What skydive affects

The module offers a class to install and manage the Skydive Analyzer and Agent separately.

Depending on the configuration, it may affect:

* Management of the Yum Repository
* Management of the skydive binary
* Skydive RPM packages

### Beginning with skydive

## Usage

Simple include with defaults

```
  include ::skydive::agent
  include ::skydive::analyzer
```

Override the logging settings

```
---
skydive::logging:
  level: INFO
  backends:
    - file
  file: /var/log/skydive.log
```

Configure embedded etcd and list servers

```
---
skydive::etcd:
  embedded: true
  listen: '0.0.0.0:2379'
  servers:
    - http://192.168.10.10:2379
    - http://192.168.10.11:2379
  client_timeout: 5
```

Configure the agents to talk to the analyzer

```
---
skydive::analyzers:
  - 192.168.10.10:8082
```

Change default address and port of the analyzer's UI. (don't forget to correct the port in skydive::analyzers)

```
---
skydive::analyzer::listen: 0.0.0.0:80
```

Specify a specific version through Web installation

```
---
skydive::installation_type: web
skydive::version: 0.12.0
skydive::web_checksum: '66959586f0865e39f9a66cf30f2b87de5b10921a'
```

Specify a Package installation

```
---
skydive::installation_type: package
skydive::version: present
```


## Limitations

The module has been tested on:

* Centos 7
