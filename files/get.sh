#!/bin/sh
# Get the uploaded file with given id
#
# Parameter:
#   file - string, the identifier of the uploaded file
#
# Reference:
# [1] Stripe API > Core Resources > File Uploads > Retrieve a file upload
# https://stripe.com/docs/api#retrieve_file_upload
#
cd "$(dirname "$0")"

stripeFileId="${1#file=}"
if test -z "$stripeFileId"
then
  echo "Usage: $0 file" 1>&2
  exit 1
fi

../request.sh GET "files/$stripeFileId"
