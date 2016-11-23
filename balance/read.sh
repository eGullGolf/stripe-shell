#!/bin/sh
# Get the current balance of the account
#
# Reference:
# Stripe API > Core Resources > Balance > Retrieve balance
# https://stripe.com/docs/api#retrieve_balance
#
cd "$(dirname "$0")"

../request.sh GET balance
