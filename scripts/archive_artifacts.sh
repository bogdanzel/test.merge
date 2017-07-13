ARTIFACTSPATH=$1

# Reading config file
# Get ${PLISTFILE}
source scripts/parameters.config

# Get and parse version
CURRENTNUMBER=`/usr/libexec/PlistBuddy -c "print :CFBundleVersion" "${PLISTFILE}"`
echo Current number: ${CURRENTNUMBER}

# Copy artifacts
echo Create artifacts folder "${ARTIFACTSPATH}/${CURRENTNUMBER}"
mkdir "${ARTIFACTSPATH}/${CURRENTNUMBER}"

echo Copy "*.ipa" to "${ARTIFACTSPATH}/${CURRENTNUMBER}"
cp build/**/*.ipa "${ARTIFACTSPATH}/${CURRENTNUMBER}"

# Get ipa file name
IPAFILE=$(ls build/**/*.ipa)
IPABASENAME=$(basename "$IPAFILE")
IPAFILENAME="${IPABASENAME%.*}"

# Zip artifacts
echo Archive build/**/*.xcarchive/dSYMs/*.dSYM to "${ARTIFACTSPATH}/${CURRENTNUMBER}/${IPAFILENAME}.zip"
zip -r "${ARTIFACTSPATH}/${CURRENTNUMBER}/${IPAFILENAME}.zip" build/**/*.xcarchive/dSYMs/*.dSYM