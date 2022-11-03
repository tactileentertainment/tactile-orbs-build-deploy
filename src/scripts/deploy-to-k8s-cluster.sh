#!/usr/bin/env bash

deployToK8sCluster() {
  gcloud container clusters get-credentials --zone "$CLUSTER_ZONE" "$CLUSTER_NAME"
  kubectl version
  kubectl apply --cluster gke_tactile-webservices_"$CLUSTER_ZONE"_"$CLUSTER_NAME" -f "$CONFIGURATION_PATH" --validate --prune --selector "$PRUNE_SELECTOR"
}

# Will not run if sourced for bats-core tests.
ORB_TEST_ENV="bats-core"
if [ "${0#*"$ORB_TEST_ENV"}" == "$0" ]; then
    deployToK8sCluster
fi
