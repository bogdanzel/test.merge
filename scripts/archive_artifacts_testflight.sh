ARTIFACTSPATH=$1

# Reading config file
# Get ${PLISTFILE}
source scripts/parameters.config

# Get and parse version
CURRENTNUMBER=`/usr/libexec/PlistBuddy -c "print :CFBundleVersion" "${PLISTFILE}"`
echo Current number: ${CURRENTNUMBER}

# Create artifacts folder
echo Create artifacts folder "${ARTIFACTSPATH}/${CURRENTNUMBER}"
mkdir "${ARTIFACTSPATH}/${CURRENTNUMBER}"

# Copy artifacts
echo Copy "*.ipa" to "${ARTIFACTSPATH}/${CURRENTNUMBER}"
cp *.ipa "${ARTIFACTSPATH}/${CURRENTNUMBER}"

echo Copy "*.zip" to "${ARTIFACTSPATH}/${CURRENTNUMBER}"
cp *.zip "${ARTIFACTSPATH}/${CURRENTNUMBER}"