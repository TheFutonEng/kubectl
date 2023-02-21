#!/bin/bash
tag="0.3"
docker login
docker build -t thefutoneng/kubectl:$tag .
docker push thefutoneng/kubectl:$tag