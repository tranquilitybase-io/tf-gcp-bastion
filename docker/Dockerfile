FROM alpine:latest
MAINTAINER "GFT"

ARG GCLOUD_VERSION=319.0.0
ARG TERRAFORM_VERSION=0.14.2
ARG TERRAGRUNT_VERSION=0.26.7
ARG PACKER_VERSION=1.6.5

ENV ACTIVATOR_NAME=tf-gcp-bastion
ENV CLOUDSDK_PYTHON=python3
ENV PATH /usr/lib/google-cloud-sdk/bin:$PATH
ENV TF_PLUGIN_CACHE_DIR=/opt/terraform/plugins

RUN set -eux && \
    apk add --no-cache --update \
    bash \
    bash-completion \
    git \
    jq \
    wget \
    unzip \
    python3 \
    py3-pip \
    py3-crcmod \
    && \
    \
    pip3 install --upgrade pip && \
    \
    wget -q -O /tmp/google-cloud-sdk.tgz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_VERSION}-linux-x86_64.tar.gz && \
    tar xzf /tmp/google-cloud-sdk.tgz -C /usr/lib/ && \
    rm /tmp/google-cloud-sdk.tgz && \
    ln -s /lib /lib64 && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud components install alpha beta kubectl --quiet && \
    \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/tmp/*

RUN set -eux && \
    wget -q -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip -q /tmp/terraform.zip -d /tmp && \
    chmod +x /tmp/terraform && \
    mv /tmp/terraform /usr/local/bin && \
    \
    wget -q -O /tmp/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 && \
    chmod +x /tmp/terragrunt && \
    mv /tmp/terragrunt /usr/local/bin && \
    \
    wget -q -O /tmp/packer.zip https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
    unzip -q /tmp/packer.zip -d /tmp && \
    chmod +x /tmp/packer && \
    mv /tmp/packer /usr/local/bin && \
    \
    mkdir -p ${TF_PLUGIN_CACHE_DIR}/linux_amd64 && \
    terraform -version && \
    terragrunt -version && \
    packer -version

COPY *.sh /tmp/

RUN \
    adduser -Ds /bin/bash jenkins && \
    \
    . /tmp/10-terraform-providers.sh && \
    chmod -R 777 ${TF_PLUGIN_CACHE_DIR} && \
    \
    . /tmp/20-bashrc.sh && \
    \
    rm -rf /tmp/* && \
    rm ~/.wget-hsts
