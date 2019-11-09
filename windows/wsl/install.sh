#!/usr/bin/env bash

# exit on error
set -e

# upgrade everything
apt update && apt upgrade -y

# lastpass-cli
# see: https://github.com/LastPass/lastpass-cli  
apt install -y \
  bash-completion \
  build-essential \
  cmake \
  libcurl4  \
  libcurl4-openssl-dev  \
  libssl-dev  \
  libxml2 \
  libxml2-dev  \
  libssl1.1 \
  pkg-config \
  ca-certificates \
  xclip \
  lastpass-cli

# apt-clone
apt install -y apt-clone

# docker
curl https://raw.githubusercontent.com/docker/docker-install/master/install.sh --output install-docker.sh
./install-docker.sh
apt install -y docker-compose

# kubectl
# see: https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux
apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl

# kubectx & kubens
curl -O https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx && chmod +x kubectx && mv kubectx /usr/local/bin/

curl -O https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens && chmod +x kubens && sudo mv kubens /usr/local/bin/

# helm
# see: https://helm.sh/docs/using_helm/#installing-helm
curl -LO https://git.io/get_helm.sh && chmod 700 get_helm.sh && ./get_helm.sh
helm init --client-only
helm plugin install https://github.com/sagansystems/helm-github.git
helm plugin install https://github.com/rimusz/helm-tiller
helm plugin install https://github.com/maorfr/helm-restore

# awscli
apt install -y awscli
