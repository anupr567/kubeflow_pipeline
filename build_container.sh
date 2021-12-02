CONTAINER_NAME=kfp-pipeline-$(basename $(pwd))                      # add custom prefix before component name i.e. prefix-component_name, 'kfp-pipeline' is prefix here
DIR_IN_REPO=$(pwd | sed 's%components/% %g' | awk '{print $2}')     # components/component_name
REPO_DIR=$(pwd | sed 's%components/%components %g' | awk '{print $1}')    #  ~/repo_name

echo "Creating ${CONTAINER_NAME}:latest from this Dockerfile:"
cat ${REPO_DIR}/${DIR_IN_REPO}/Dockerfile                          # ~/repo_name/components/component_name/Dockerfile


if [ -z "$1" ]; then                                               # if giving the project ID as first argument then take that else get it
  PROJECT_ID=$(gcloud config config-helper --format "value(configuration.properties.core.project)")
else
  PROJECT_ID=$1
fi

if [ -z "$2" ]; then                                               # if giving the tag as second argument then take that else give it "latest"
  TAG_NAME="latest"
else
  TAG_NAME="$2"
fi

# Create the build configuration file i.e. cloudbuild.yaml
cat <<EOM > cloudbuild.yaml
steps:
    - name: 'gcr.io/cloud-builders/docker'
      dir:  '${DIR_IN_REPO}'   # remove-for-manual
      args: [ 'build', '-t', 'gcr.io/${PROJECT_ID}/${CONTAINER_NAME}:${TAG_NAME}', '.' ]
images:
    - 'gcr.io/${PROJECT_ID}/${CONTAINER_NAME}:${TAG_NAME}'
EOM
# Running build through cloudbuild.yaml file
# on the manual build, we should not specify dir:, but for github trigger, we need it
cat cloudbuild.yaml | grep -v "remove-for-manual" > /tmp/$$
cat /tmp/$$
gcloud builds submit . --config /tmp/$$
