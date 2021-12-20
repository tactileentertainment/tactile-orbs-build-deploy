# Runs prior to every test
setup() {
    source ./src/scripts/tag-release.sh
}

@test 'tag-release: Install dependencies' {
    install
}

@test 'tag-release: Copy configuration file when specified' {
    export SEMANTIC_RELEASE_CONFIG_PATH="other.config.js"
    touch "$SEMANTIC_RELEASE_CONFIG_PATH"

    copyConfiguration

    [ -f "release.config.js" ]

    rm "other.config.js"
    rm "release.config.js"
}
