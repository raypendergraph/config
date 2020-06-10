go-env() {
  local env=`ls ~/go | grep go | fzf`
  export GOROOT=~/go/$env
  export GOPATH=~/go/paths/$env
}
