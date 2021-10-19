# Runs prior to every test
setup() {
    source ./src/scripts/tag-release.sh
}

@test 'tag-release: Install dependencies' {
    install
}
