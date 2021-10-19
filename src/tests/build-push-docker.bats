# Runs prior to every test
setup() {
    source ./src/scripts/build-push-docker.sh
}

@test '1: Install dependencies' {
    install
}
