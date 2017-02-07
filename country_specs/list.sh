#!/bin/sh
# Get the list of information required by each country for a Stripe account
#
# Parameters:
#    ... - see [1] for the list of optional parameters
#
# Reference:
# [1] Stripe API > Connect > Country Specs > List Country Specs
# https://stripe.com/docs/api#list_country_specs
#
cd "$(dirname "$0")"

../request.sh GET country_specs "$@"
