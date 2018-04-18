#!/usr/bin/env bash

./gradlew clean shadowJar
gcloud container builds submit --tag=gcr.io/kidcontrol2-b938c/echo:v7 .
kubectl delete deployment echo1
kubectl delete deployment echo2
kubectl run echo1 --image=gcr.io/kidcontrol2-b938c/echo:v7 --port 5701
kubectl run echo2 --image=gcr.io/kidcontrol2-b938c/echo:v7 --port 5701