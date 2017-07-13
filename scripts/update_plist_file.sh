BUILDNUMBER=$1

# Reading config file
# Get ${PLISTFILE}
source scripts/parameters.config

# Get and parse version
CURRENTNUMBER=`/usr/libexec/PlistBuddy -c "print :CFBundleVersion" "${PLISTFILE}"`
echo Current number: ${CURRENTNUMBER}
IFS='.' read -ra NUMBERS <<< "$CURRENTNUMBER"
VERSION="${NUMBERS[0]}.${NUMBERS[1]}.${BUILDNUMBER}"

# Set version 
echo Set version ${VERSION}
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion '${VERSION}'" "${PLISTFILE}"
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString '${VERSION}'" "${PLISTFILE}"