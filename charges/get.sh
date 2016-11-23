#!/bin/sh
# Get details of a charge
#
# Parameter:
#   charge - string, identifier of the charge to retrieve
#
# Reference:
# [1] Stripe API > Core Resources > Charge > Retrieve a charge
# https://stripe.com/docs/api/curl#retrieve_charge
#
cd "$(dirname "$0")"

stripeChargeId="${1#charge=}"
if test -z "$stripeChargeId"
then
  echo "Usage: $0 charge" 1>&2
  exit 1
fi

../request.sh GET "charges/$stripeChargeId"
