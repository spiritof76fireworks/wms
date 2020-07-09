. ./vars.sh
. ./dev-vars.sh

. ./gcloud-init-auth.sh

if [ -z "$OLD_IMAGES_TO_KEEP" ]; then
    images_to_keep=10
else
    echo "OLD_IMAGES_TO_KEEP"
    echo $OLD_IMAGES_TO_KEEP
    images_to_keep=$OLD_IMAGES_TO_KEEP
    echo "in if"
    echo $images_to_keep
fi

. ./repo-cleanup-loop.sh
