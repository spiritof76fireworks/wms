latest=`kubectl get deployment $APP_NAME-server-deployment -o jsonpath="{..image}" |awk -F ":" '{print $2}'`

count=1
image_path=$REPOSITORY/$PROJECT_NAME/$APP_NAME

echo $image_path
images_to_keep = 10

echo $images_to_keep

if [ -z "$OLD_IMAGES_TO_KEEP" ]; then
    echo "OLD_IMAGES_TO_KEEP"
    echo $OLD_IMAGES_TO_KEEP
    images_to_keep=$OLD_IMAGES_TO_KEEP
    echo "in if"
    echo $images_to_keep
fi

for digest in $(gcloud container images list-tags $image_path --limit=9999 --sort-by=~TIMESTAMP --filter="NOT tags = $latest" --format='get(digest)' );
do
    if [ $count -gt $images_to_keep ]; then
        echo DELETE
        gcloud container images describe $image_path@$digest
        # gcloud container images delete --quiet --force-delete-tags $image_path@$digest
    else
        echo SKIP
        gcloud container images describe $image_path@$digest
    fi

    count=$((count + 1))
done
