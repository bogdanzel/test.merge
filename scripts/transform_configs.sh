PARAMETER=${1}
VALUE=${2}
FILE=${3}

echo "Transform ${FILE}"
echo "-Replace ${PARAMETER} to ${VALUE}"
sed -i '' "s/${PARAMETER}/${VALUE}/g" "${FILE}"