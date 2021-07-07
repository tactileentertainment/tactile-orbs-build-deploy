# Runs prior to every test
setup() {
    source ./src/scripts/tag-release.sh
}

@test '1: Install dependencies' {
    install
}
