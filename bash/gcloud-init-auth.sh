gcloud auth activate-service-account $SERVICE_ACCOUNT --key-file="$so76_spark_deployer" --project=$PROJECT_NAME

cat "$so76_spark_deployer" | docker login -u _json_key --password-stdin https://gcr.io

gcloud config set project $PROJECT_NAME
gcloud config set compute/zone $COMPUTE_ZONE
gcloud container clusters get-credentials $CLUSTER_NAME