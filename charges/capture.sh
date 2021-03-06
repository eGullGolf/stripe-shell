#!/bin/sh
# Capture a charge (confirm a pre-authorized charge)
#
# Parameters:
#   charge - string, identifier of the charge to modify
#            (this required parameter must be given first)
#   ... - see [1] for the list of optional parameters
#
# Reference:
# [1] Stripe API > Core Resources > Charges > Capture a charge
# https://stripe.com/docs/api/curl#capture_charge
#
cd "$(dirname "$0")"

stripeChargeId="${1#charge=}"
if test -z "$stripeChargeId"
then
  echo "Usage: $0 charge ..." 1>&2
  exit 1
fi

shift 1
../request.sh 'POST' "charges/$stripeChargeId/capture" "$@"
