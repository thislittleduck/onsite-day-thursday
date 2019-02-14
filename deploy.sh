#!/usr/bin/env bash
set -e

PROJECT_DIR=$(cd `dirname $0` && pwd)
# PROJECT_DIR=$(cd $SCRIPT_DIR; cd ../../ && pwd)
# DOCS_DIR=$PROJECT_DIR'/user-guide'
SITE_DIR=$PROJECT_DIR'/dist'

# check for surge
if [ -x "$(command -v surge)" ]; then
    echo 'Found Surge.sh, moving forward...';
else
    echo 'Cannot find Surge, exiting';
    exit 1;
fi

# deploy the contents of SITE_DIR
if ! [ -d $SITE_DIR ]; then
    echo "There's no site directory, exiting";
    exit 1;
fi

# Add a CNAME folder into our site root for surge config
echo onsite-day-thursday.thislittleduck-sites.com > $SITE_DIR/CNAME

# Deploy to surge
surge $SITE_DIR