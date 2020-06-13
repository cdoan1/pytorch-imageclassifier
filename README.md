# pytorch-imageclassifier

pytorch image classifier on Kubernetes | OpenShift Container Platform

1. use a pre-trained PyTorch model and Flask application
2. create a simple machine learning web service

## Usage

1. deploy to your k8s cluster

    ```bash
    oc apply -f k8s/deployment.yaml
    ```

2. for OpenShift Container Platform deployment, expose the service

    ```bash
    oc expose service image-classifier
    ```

3. query the inference service

    ```bash
    ./hack/input.sh https://s23705.pcdn.co/wp-content/uploads/2019/12/roadies-2-e1576036605279.jpg
    [["unicycle", 34.30458450317383]]
    ```

## Attribution

* based on the article: https://towardsdatascience.com/how-to-deploy-your-machine-learning-models-on-kubernetes-36e260027ce1
