#!/bin/sh
# Upload a file
#
# Parameters:
#   filePath - string, path to the file to upload
#   purpose - string, the purpose of the uploaded file.
#             Possible values are:
#               * business_logo
#               * customer_signature
#               * dispute_evidence
#               * identity_document
#               * pci_document
#               * tax_document_user_upload
#
# Output:
#   newly created file upload object, in JSON format
#
# References:
# [1] Stripe API > Core Resources > File Uploads > Create a file upload
# https://stripe.com/docs/api#create_file_upload
#
filePath="${1#file=}"
purpose="${2#purpose=}"

if test ! -r "$filePath" -o -z "$purpose"
then
  echo "Usage: $0 filePath purpose" 1>&2
  exit 1
fi

cd "$( dirname "$filePath" )"
absoluteFilePath="$( pwd )/$( basename "$filePath" )"
cd -

cd "$(dirname "$0")"
../request.sh FILE files "file=@$absoluteFilePath" "purpose=$purpose"
