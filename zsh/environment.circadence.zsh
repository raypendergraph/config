
export KUBECONFIG=~/.config.k8s-pddev.rpendergraph
export TILLER_NAMESPACE=$(security find-generic-password -s tiller-namespace -w)
export GOPROXY="http://rpendergraph:$(security find-generic-password -s artifactory-api-key -w)@artifactory.dev.circadence.net/artifactory/api/go/go"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron"
