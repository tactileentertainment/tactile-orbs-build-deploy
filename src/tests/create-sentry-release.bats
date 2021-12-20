# Runs prior to every test
setup() {
    source ./src/scripts/create-sentry-release.sh
}

@test 'create-sentry-release: Install dependencies' {
    install
}
