# GSM Sources Manager for Ruby Gems

[![Gem Version](https://badge.fury.io/rb/gsm-sources-manager.svg)](https://badge.fury.io/rb/gsm-sources-manager)
[![](https://api.travis-ci.org/crispgm/gsm.svg)](https://travis-ci.org/crispgm/gsm)
[![Build status](https://ci.appveyor.com/api/projects/status/3mgxei9imr94w67k?svg=true)](https://ci.appveyor.com/project/crispgm/gsm)
[![Code Climate](https://codeclimate.com/github/crispgm/gsm/badges/gpa.svg)](https://codeclimate.com/github/crispgm/gsm)
[![Test Coverage](https://codeclimate.com/github/crispgm/gsm/badges/coverage.svg)](https://codeclimate.com/github/crispgm/gsm/coverage)

GSM is a simple sources manager for RubyGems. GSM means GSM Sources Manager as a recursive acronym or simply Gem Sources Manager.

In Ruby development, we always need alternative RubyGems source in special networks. e.g. In China Mainland, you know. GSM helps get your gem sources managed.

# Installation

## Install with RubyGems

```
$ gem install gsm-sources-manager
$ gsm --version
```

## Or, you may install manually

```
$ git clone https://github.com/crispgm/gsm.git
$ bundle install
$ bundle exec exe/gsm --version
```

# Documentation

## Getting Started

Once you have installed and bootstrapped `gsm` with commands other than `--help` or `--version`, `gsm` will load sources from local `gem sources -l`.
HINT: The sources will be named after gemstones, e.g. _Amethyst_.

## Commands

### List

List sources within `gsm`.

```
$ gsm list
Amethyst: https://gems.ruby-china.org/
```

### Use

Use a source with `source_name`.

```
$ gsm use Amethyst
GSM: Source `Amethyst` has been applied.
```
```
$ gsm list

Amethyst: https://rubygems.org/ (*)
```

### Add

Use a source with `source_name` and `source_url`.

`--use`: Use the input source as well. Equivalent to `gsm add` and then `gsm use`.

```
$ gsm add Amethyst https://rubygems.org/
```

#### Available Sources

* [RubyGems](https://rubygems.org/)
* [RubyChina](https://gems.ruby-china.org/)
* [Taobao](https://ruby.taobao.org/) _Deprecated_

### Del

Delete a source with `source_name`.

```
$ gsm del Amethyst
```

### Reset

Reset all sources.

```
$ gsm reset
```

### Mirror

Mirror the source with `bundle`.

`--reset`: Reset mirror of bundle configuration.

```
$ gsm mirror Amethyst
```

### Help

Show help info.

```
$ gsm help
```

## API Reference

TODO: API Reference of `libgsm`.

# Contributing

* [GSM Sources Manager](https://github.com/crispgm/gsm) is licensed under [MIT License](/LICENSE).
* If there is a bug, you may [file an issue](https://github.com/crispgm/gsm/issues/new) or pull request directly.
* Pull requests for contribution is welcomed.
