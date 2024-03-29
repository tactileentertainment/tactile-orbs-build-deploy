#!/usr/bin/env bash

gitMergeBack() {
  git config --global user.email "$GIT_USER_EMAIL"
  git config --global user.name "$GIT_USER_NAME"
  git fetch --all
  git checkout "$MERGE_DESTINATION_BRANCH"
  git merge origin "$MERGE_TRIGGER_BRANCH"
  git push origin "$MERGE_DESTINATION_BRANCH"
  git checkout "$MERGE_TRIGGER_BRANCH"
}

# Will not run if sourced for bats-core tests.
ORB_TEST_ENV="bats-core"
if [ "${0#*"$ORB_TEST_ENV"}" == "$0" ]; then
    gitMergeBack
fi
