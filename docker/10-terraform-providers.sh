#!/bin/bash
set -e

for version in 3.49.0
do
  echo "Downloading google provider version: $version"
  wget -q https://releases.hashicorp.com/terraform-provider-google/${version}/terraform-provider-google_${version}_linux_amd64.zip
  unzip -q terraform-provider-google_${version}_linux_amd64.zip -d "${TF_PLUGIN_CACHE_DIR}"/linux_amd64
  rm terraform-provider-google_${version}_linux_amd64.zip

  wget -q https://releases.hashicorp.com/terraform-provider-google-beta/${version}/terraform-provider-google-beta_${version}_linux_amd64.zip
  unzip -q terraform-provider-google-beta_${version}_linux_amd64.zip -d "${TF_PLUGIN_CACHE_DIR}"/linux_amd64
  rm terraform-provider-google-beta_${version}_linux_amd64.zip
done

wget -q https://releases.hashicorp.com/terraform-provider-random/2.3.1/terraform-provider-random_2.3.1_linux_amd64.zip
unzip -q terraform-provider-random_2.3.1_linux_amd64.zip -d "${TF_PLUGIN_CACHE_DIR}"/linux_amd64
rm terraform-provider-random_2.3.1_linux_amd64.zip

wget -q https://releases.hashicorp.com/terraform-provider-template/2.2.0/terraform-provider-template_2.2.0_linux_amd64.zip
unzip -q terraform-provider-template_2.2.0_linux_amd64.zip -d "${TF_PLUGIN_CACHE_DIR}"/linux_amd64
rm terraform-provider-template_2.2.0_linux_amd64.zip

wget -q https://releases.hashicorp.com/terraform-provider-null/3.0.0/terraform-provider-null_3.0.0_linux_amd64.zip
unzip -q terraform-provider-null_3.0.0_linux_amd64.zip -d "${TF_PLUGIN_CACHE_DIR}"/linux_amd64
rm terraform-provider-null_3.0.0_linux_amd64.zip

wget -q https://releases.hashicorp.com/terraform-provider-local/2.0.0/terraform-provider-local_2.0.0_linux_amd64.zip
unzip -q terraform-provider-local_2.0.0_linux_amd64.zip -d "${TF_PLUGIN_CACHE_DIR}"/linux_amd64
rm terraform-provider-local_2.0.0_linux_amd64.zip

wget -q https://releases.hashicorp.com/terraform-provider-http/2.0.0/terraform-provider-http_2.0.0_linux_amd64.zip
unzip -q terraform-provider-http_2.0.0_linux_amd64.zip -d "${TF_PLUGIN_CACHE_DIR}"/linux_amd64
rm terraform-provider-http_2.0.0_linux_amd64.zip
