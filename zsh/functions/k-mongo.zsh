k-mongo () {
  local namespace=${1:-$TILLER_NAMESPACE}
  local hostPort=$(kubectl get endpoints mongo -n${namespace} -o jsonpath="{.subsets[0].addresses[0].ip}:{.subsets[0].ports[0].port}")
  echo "mongo in ${namespace} (${hostPort})"
  mongo --quiet --host $hostPort
}

