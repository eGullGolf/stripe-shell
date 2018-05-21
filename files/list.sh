#!/bin/sh
# List of all uploaded files
#
# Parameters:
#   ... - see [1] for the list of optional parameters
#
# Reference:
# [1] Stripe API > Core Resources > File Uploads > List all file uploads
# https://stripe.com/docs/api#list_file_uploads
#
cd "$(dirname "$0")"

../request.sh GET files "$@"
