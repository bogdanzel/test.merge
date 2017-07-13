KEYCHAINPASSWORD=$1

# Unlock Keychain
security default-keychain -s /Users/user/Library/Keychains/jenkins.keychain
security unlock-keychain -p ${KEYCHAINPASSWORD} /Users/user/Library/Keychains/jenkins.keychain
security set-keychain-settings -l -u -t 3600 ~/Library/Keychains/jenkins.keychain
security set-key-partition-list -S apple-tool:,apple:,codesign: -s -k ${KEYCHAINPASSWORD} ~/Library/Keychains/jenkins.keychain