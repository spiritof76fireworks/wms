. ./vars.sh
. ./dev-vars.sh

. ./gcloud-init-auth.sh

echo "OLD_IMAGES_TO_KEEP"
echo $OLD_IMAGES_TO_KEEP

images_to_keep=5
. ./repo-cleanup-loop.sh
