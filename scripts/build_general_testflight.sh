KEYCHAINPASSWORD=${1}
BUILD_NUMBER=${2}
SCHEME=${3}
APP_IDENTIFIER=${4}
ITUNES_CONNECT_PASSWORD=${5}
ARTIFACTSPATH=${6}

# Unlock keychain
chmod 755 scripts/unlock_keychain.sh
./scripts/unlock_keychain.sh ${KEYCHAINPASSWORD}

# Update version in plist file
chmod 755 scripts/update_plist_file.sh
./scripts/update_plist_file.sh ${BUILD_NUMBER}

# Transform configs for fastlane
chmod 755 scripts/transform_configs.sh
./scripts/transform_configs.sh "TRANSFORM_VALUE_SCHEME" "${SCHEME}" "fastlane/Fastfile"
./scripts/transform_configs.sh "TRANSFORM_VALUE_APP_ID" "${APP_IDENTIFIER}" "fastlane/Fastfile"
./scripts/transform_configs.sh "TRANSFORM_VALUE_APP_ID" "${APP_IDENTIFIER}" "fastlane/Appfile"
./scripts/transform_configs.sh "TRANSFORM_VALUE_APP_ID" "${APP_IDENTIFIER}" "fastlane/Deliverfile"

# Build fastlane and upload the new binary to iTunes Connect
chmod 755 scripts/build_fastlane.sh
./scripts/build_fastlane.sh "${ITUNES_CONNECT_PASSWORD}"

# Copy artifacts to ARTIFACTSPATH
chmod 755 scripts/archive_artifacts_testflight.sh
./scripts/archive_artifacts_testflight.sh "${ARTIFACTSPATH}"