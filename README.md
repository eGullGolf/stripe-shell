# stripe-shell
Shell Client for Stripe API

# Configuration

The configuration is read from the following locations,
in given order:

* `config.sh` - default parameters
  (part of this git project)
* `/etc/stripe-shell/config.sh` - custom parameters
  (shared location outside project)
* `config.my.sh` - custom parameters
  (local file, ignored by git)

Only the first file is mandatory; when no custom API key is provided,
the test API key found in Stripe documentation is used by default.
Properties defined in configuration files loaded after supersede
properties defined in configuration files loaded before. You could
for example define your production API key in `/etc/stripe-shell/config.sh`
and your test development key in `custom.my.sh`.

# Requirements

This software uses [cUrl](https://curl.haxx.se/) utility to issue requests.
It is commonly found already installed on Unix systems.
