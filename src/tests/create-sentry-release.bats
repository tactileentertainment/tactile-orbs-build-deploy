# Runs prior to every test
setup() {
    source ./src/scripts/create-sentry-release.sh
}

@test '1: Install dependencies' {
    install
}
