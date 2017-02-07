#!/bin/sh
# Get details of an event
#
# Parameter:
#   event - string, identifier of the event to retrieve
#
# Reference:
# [1] Stripe API > Core Resources > Event > Retrieve an event
# https://stripe.com/docs/api#retrieve_event
#
cd "$(dirname "$0")"

stripeEventId="${1#event=}"
if test -z "$stripeEventId"
then
  echo "Usage: $0 event" 1>&2
  exit 1
fi

../request.sh GET "events/$stripeEventId"
