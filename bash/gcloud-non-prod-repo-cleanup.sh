. ./vars.sh
. ./non-prod-vars.sh

. ./gcloud-init-auth.sh

if [ -z "$OLD_IMAGES_TO_KEEP" ]; then
    images_to_keep=10
else
    images_to_keep=$OLD_IMAGES_TO_KEEP
fi

echo "IMAGES TO KEEP: $images_to_keep"

APP_NAME="api2-dev"
. ./repo-cleanup-loop.sh

APP_NAME="app2-dev"
. ./repo-cleanup-loop.sh

APP_NAME="pwa2-dev"
. ./repo-cleanup-loop.sh

APP_NAME="api2-qa"
. ./repo-cleanup-loop.sh

APP_NAME="app2-qa"
. ./repo-cleanup-loop.sh

APP_NAME="pwa2-qa"
. ./repo-cleanup-loop.sh

APP_NAME="api2-ua"
. ./repo-cleanup-loop.sh

APP_NAME="app2-ua"
. ./repo-cleanup-loop.sh

APP_NAME="pwa2-ua"
. ./repo-cleanup-loop.sh
