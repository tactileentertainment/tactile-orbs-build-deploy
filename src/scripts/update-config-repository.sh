#!/usr/bin/env bash

updateConfigRepository() {
  cd ..
  git clone "$CONFIG_REPOSITORY" config-repository
  # shellcheck disable=SC2164
  cd config-repository
  git checkout master

  bash -c "$CONFIG_UPDATE_COMMAND"

  git commit -m "build(release): $CIRCLE_PROJECT_REPONAME $IMAGE_TAG" -a
  git tag -a "$IMAGE_TAG" -m "$CIRCLE_PROJECT_REPONAME $IMAGE_TAG"
  git push origin master --tags
  git push origin master:"$CONFIG_BRANCH"
}

# Will not run if sourced for bats-core tests.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    updateConfigRepository
fi
