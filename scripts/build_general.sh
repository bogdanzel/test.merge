KEYCHAINPASSWORD=${1}
BUILD_NUMBER=${2}

# Install pod
chmod 755 scripts/install_pod.sh
./scripts/install_pod.sh

# Unlock keychain
chmod 755 scripts/unlock_keychain.sh
./scripts/unlock_keychain.sh ${KEYCHAINPASSWORD}

# Update version in plist file
chmod 755 scripts/update_plist_file.sh
./scripts/update_plist_file.sh ${BUILD_NUMBER}