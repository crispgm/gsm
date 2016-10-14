# GSM Sources Manager for Ruby Gems

![](https://img.shields.io/badge/license-MIT-blue.svg)
[![](https://api.travis-ci.org/crispgm/gsm.svg)](https://travis-ci.org/crispgm/gsm)
[![Code Climate](https://codeclimate.com/github/crispgm/gsm/badges/gpa.svg)](https://codeclimate.com/github/crispgm/gsm)
[![Test Coverage](https://codeclimate.com/github/crispgm/gsm/badges/coverage.svg)](https://codeclimate.com/github/crispgm/gsm/coverage)
[![BADGINATOR](https://badginator.herokuapp.com/crispgm/gsm.svg)](https://github.com/defunctzombie/badginator)

GSM means GSM Sources Manager as a recursive acronym or simply Gem Sources Manager.

## Installation

```
gem install gsm-sources-manager
```

## Usage

```
Usage: gsm [options] [command]

    Commands:

      list                       List all sources
      use <source>               Use source
      add <source> <url>         Add source
      del <source>               Delete source
      reset                      Reset all sources
      mirror [source=CUR_SOURCE] Set bundler mirror to source
             [--reset]           Reset bundler mirror

    Options:

      -h, --help
      -v, --version 
```

## Sources

* [RubyGems](https://rubygems.org/)
* [RubyChina](https://gems.ruby-china.org/)
* [Taobao](https://ruby.taobao.org/)

## License

[MIT](/LICENSE)