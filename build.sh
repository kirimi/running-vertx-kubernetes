#!/usr/bin/env bash

./gradlew clean shadowJar
gcloud container builds submit --tag=gcr.io/kidcontrol2-b938c/echo:v50 .

