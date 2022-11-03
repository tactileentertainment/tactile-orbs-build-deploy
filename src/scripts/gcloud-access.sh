#!/usr/bin/env bash

gcloudAccess() {
  echo "$GCP_SERVICE_KEY" | gcloud auth activate-service-account --key-file=-
  gcloud --quiet config set project "$GCP_PROJECT"
}

# Will not run if sourced for bats-core tests.
ORB_TEST_ENV="bats-core"
if [ "${0#*"$ORB_TEST_ENV"}" == "$0" ]; then
    gcloudAccess
fi
