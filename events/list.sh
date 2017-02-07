#!/bin/sh
# List all events, going back up to 30 days
#
# Parameters:
#   ... - see [1] for the list of optional parameters
#
# Reference:
# [1] Stripe API > Core Resources > Events > List all events
# https://stripe.com/docs/api#list_events
#
cd "$(dirname "$0")"

../request.sh GET events "$@"
