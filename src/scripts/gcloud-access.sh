#!/usr/bin/env bash

gcloudAccess() {
  echo "$GCLOUD_SERVICE_KEY" | gcloud auth activate-service-account --key-file=-
  gcloud --quiet config set project "$GOOGLE_PROJECT_ID"
}

# Will not run if sourced for bats-core tests.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    gcloudAccess
fi
