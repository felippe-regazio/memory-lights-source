set -o

TARGET_REPOSITORY_URL='https://github.com/felippe-regazio/memory-lights.git'
TEMP_DEPLOYMENT_BRANCH='gh-page-tmp'
DISTRIBUTION_DIRECTORY='dist'

npm run build

if [ "$(git status --porcelain)" ];
then
  git status
  echo "Deployment Error: Git State not clean."
  exit 1;
fi

cd dist

git add .
git commit -m "deploy"
git push -f ${TARGET_REPOSITORY_URL} ${TEMP_DEPLOYMENT_BRANCH}:master