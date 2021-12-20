#!/usr/bin/env bash

createSentryRelease() {
  install
  SENTRY_PROJECT=$CIRCLE_PROJECT_REPONAME
  SENTRY_RELEASE=$SENTRY_PROJECT@$RELEASE_TAG
  sentry-cli releases new -p "$SENTRY_PROJECT" "$SENTRY_RELEASE"
  sentry-cli releases set-commits --auto "$SENTRY_RELEASE" || true
  sentry-cli releases finalize "$SENTRY_RELEASE"
  sentry-cli releases deploys "$SENTRY_RELEASE" new -e "${ENVIRONMENT}" --name "$CIRCLE_BUILD_NUM" --url "$CIRCLE_BUILD_URL"
}

install() {
  curl -sL https://sentry.io/get-cli/ | bash
}

# Will not run if sourced for bats-core tests.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    createSentryRelease
fi
