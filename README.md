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

# Stripe Connect Configuration

The parameter `stripeConnectClientId` of the configuration file identifies
the Stripe Connect platform account for the purpose of OAuth authentication.
It starts with the prefix `ca_` and can be found in the section "Client IDs"
of the page Connect > Settings. A different identifier is provided for the
live API ("Live mode client ID") and the test API ("Test mode client ID").

# Requirements

This software uses [cUrl](https://curl.haxx.se/) utility to issue requests.
It is commonly found already installed on Unix systems.

# Usage

After having completed the configuration and checked the requirements,
you can send any request using the generic script `request.sh` at the root
of the project.

The script takes as input two parameters or more:

* the HTTP method (`GET`, `POST`, `DELETE`, ...)
* the name of the API endpoint (`balance`, `charges`, ...)
* optionally, a list of parameters for the API endpoint,
  of the form name='value', where the value is URL-encoded

The format of "dictionary" parameters is `parameter[child]=value`,
for example `created[gt]=1483356173`.

Alternatively, specific scripts are available for select endpoints,
where the folder name matches the name of the endpoint, and the
script name reflects the nature of the operation:

* `create.sh`
* `read.sh` (single value) or `get.sh` (an item in a collection)
* `update.sh`
* `delete.sh`
* `list.sh`
* ...

For example, to check the current balance of the account,
a generic request can be sent with `request.sh`:

```
$ ./request.sh GET balance
```

or a specific request can be used, found in the `balance` folder:

```
$ ./balance/read.sh
```

Arguments for the API endpoint are provided in the same format in both cases.

# Stripe Connect Usage

Using the `Stripe-Account` header, a platform account can send requests on
behalf of a connected account, as described in
[Authentication with Connect](https://stripe.com/docs/connect/authentication).

The account identifier of each connected account can be found in the dashboard
of the platform account in the page Connect > Accounts.

The value of the `Stripe-Account` header can be provided to this API by setting
the environment variable `stripeConnectAs`, as seen in the example below:

```
# events of the account acct_...
stripeConnectAs='acct_...' ./events/list.sh

# events of the platform account
./events/list.sh
```

## License

Copyright 2017 eGull SAS  
Licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)
