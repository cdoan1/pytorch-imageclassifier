DOCKER_NAMESPACE?=cdoan0
IMAGE_NAME?=pytorch-imageclassifier
TAG?=latest
DOCKER_REGISTRY?=quay.io

build:
	@docker build -t ${DOCKER_NAMESPACE}/${IMAGE_NAME}:${TAG} .

push:
	@if [ -z ${DOCKER_USERNAME} ] || [ -z ${DOCKER_TOKEN} ]; then echo "repo credentials required ..."; exit 1; fi
	@docker login -u="${DOCKER_USERNAME}" -p="${DOCKER_TOKEN}" ${DOCKER_REGISTRY}
	@docker tag ${DOCKER_NAMESPACE}/${IMAGE_NAME}:${TAG} ${DOCKER_REGISTRY}/${DOCKER_NAMESPACE}/${IMAGE_NAME}:${TAG}
	@docker push ${DOCKER_REGISTRY}/${DOCKER_NAMESPACE}/${IMAGE_NAME}:${TAG}

test:
	curl -X POST -d '{"url": "https://i.imgur.com/jD2hDMc.jpg"}' \
		-H 'Content-Type: application/json' http://127.0.0.1:5000/predict

run:
	docker run -it -p 5000:5000 \
		${DOCKER_NAMESPACE}/${IMAGE_NAME}:${TAG}

imagenet:
	if [ -f imagenet_class_index.json ]; then rm -rf imagenet_class_index.json; fi
	wget https://raw.githubusercontent.com/raghakot/keras-vis/master/resources/imagenet_class_index.json
