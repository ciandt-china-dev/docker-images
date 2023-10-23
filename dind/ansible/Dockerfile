FROM docker:latest

LABEL maintainer="kang@ciandt.com"

RUN apk add --no-cache python3 py3-pip curl

# python packages.
RUN pip3 install --root-user-action=ignore \
      awscli \
      ansible \
      boto3 \
      botocore \
      kubernetes \
      kubernetes-validate

# kubectl.
# https://github.com/lachie83/k8s-kubectl/blob/main/Dockerfile
ENV KUBE_LATEST_VERSION="v1.28.2"
RUN export ARCH="$(uname -m)" \
    && if [[ ${ARCH} == "x86_64" ]]; then export ARCH="amd64"; elif [[ ${ARCH} == "aarch64" ]]; then export ARCH="arm64"; fi \
    && curl -L https://dl.k8s.io/release/${KUBE_LATEST_VERSION}/bin/linux/${ARCH}/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl
