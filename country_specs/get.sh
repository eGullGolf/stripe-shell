#!/bin/sh
# Get the list of information required by given country for a Stripe account
#
# Parameter:
#   country - string, 2-letter ISO code of the country, in upper case
#
# Reference:
# [1] Stripe API > Connect > Country Specs > Retrieve a Country Spec
# https://stripe.com/docs/api#retrieve_country_spec
#
cd "$(dirname "$0")"

stripeCountryId="${1#country=}"
if test -z "$stripeCountryId"
then
  echo "Usage: $0 country" 1>&2
  exit 1
fi

../request.sh GET "country_specs/$stripeCountryId"
