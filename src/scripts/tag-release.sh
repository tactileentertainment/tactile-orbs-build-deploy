#!/usr/bin/env bash

tagRelease() {
  install
  copyConfiguration
  npx semantic-release
}

install() {
  npm install -g \
    semantic-release@17 \
    @semantic-release/changelog@5 \
    @semantic-release/git@9 \
    conventional-changelog-conventionalcommits@4 \
    semantic-release-slack-bot@2
}

copyConfiguration() {
  if [ "$SEMANTIC_RELEASE_CONFIG_PATH" != "release.config.js" ]; then
    cp "$SEMANTIC_RELEASE_CONFIG_PATH" release.config.js
  fi
}

# Will not run if sourced for bats-core tests.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    tagRelease
fi
