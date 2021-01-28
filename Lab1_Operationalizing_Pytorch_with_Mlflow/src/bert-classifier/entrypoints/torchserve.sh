#!/bin/bash

set -m

torchserve --start --model-store model_store & 

mlflow deployments create \
        -t torchserve \
        -m models:${MODEL_NAME} \
        --name news_classification \
        -C "MODEL_FILE=news_classifier.py" \
        -C "HANDLER=news_classifier_handler.py"

fg %1