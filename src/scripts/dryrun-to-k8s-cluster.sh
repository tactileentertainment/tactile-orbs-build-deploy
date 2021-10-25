#!/usr/bin/env bash

dryrunToK8sCluster() {
  gcloud container clusters get-credentials --zone "$CLUSTER_ZONE" "$CLUSTER_NAME"
  kubectl apply --cluster gke_tactile-webservices_"$CLUSTER_ZONE"_"$CLUSTER_NAME" -f "$CONFIGURATION_PATH" --validate --dry-run=server
}

# Will not run if sourced for bats-core tests.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    dryrunToK8sCluster
fi
