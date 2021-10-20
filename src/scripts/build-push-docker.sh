buildPushDockerImage() {
  install
  npx build-docker-image --name "$CIRCLE_PROJECT_REPONAME" --build-id "CI-$CIRCLE_BUILD_NUM"
  # shellcheck disable=SC1090
  source "$BASH_ENV"
}

install() {
  echo -e "@tactileentertainment:registry=https://npm.pkg.github.com\n//npm.pkg.github.com/:_authToken=$GITHUB_TOKEN" > ~/.npmrc
  npm install -g @tactileentertainment/ci-cd-tools@1.0.1
}

# Will not run if sourced for bats-core tests.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    buildPushDockerImage
fi
