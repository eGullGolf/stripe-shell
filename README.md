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

Properties defined in configuration files loaded after supersede
properties defined in configuration files loaded before. You could
for example define your production API key in `/etc/stripe-shell/config.sh`
and your test key in `custom.my.sh`, for use during development.

The default `config.sh` gives an empty value to the secret API key,
which prevents requests, to make sure that a custom key is configured.
A value must be set to the `stripeSecretKey` property in one of the
custom configuration files. The API keys can be found in the Account
Settings of your Stripe dashboard.

# Requirements

This software uses [cUrl](https://curl.haxx.se/) utility to issue requests.
It is commonly found already installed on Unix systems.
