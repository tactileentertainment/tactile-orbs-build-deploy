# Runs prior to every test
setup() {
    source ./src/scripts/build-push-docker.sh
}

@test 'build-push-docker: Install dependencies' {
    install
}
