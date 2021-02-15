## Setup google-cloud-sdk

```bash
brew install --cask google-cloud-sdk
```

```bash
  #for bash users
    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"

  ## for zsh users
    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

  ##for fish users
    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
```

## Terraform CLI

```bash
export http_proxy="<http://xxx.com:83>"
export https_proxy="<http://xxx.com:83>"
export no_proxy="127.0.0.1, localhost, .example.com"

export OPENSHIFT_REPO="${HOME}/Projects/workspace/Containers/openshift4"
export PATH="${OPENSHIFT_REPO}/artifacts/bin:$PATH"

curl -L -o /tmp/terraform.zip \
  https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_darwin_amd64.zip
unzip /tmp/terraform.zip -d ${OPENSHIFT_REPO}/artifacts/bin
rm -f /tmp/terraform.zip
chmod +x ${OPENSHIFT_REPO}/artifacts/bin/terraform
xattr -dr com.apple.quarantine ${OPENSHIFT_REPO}/artifacts/bin/terraform
```
