# /user/env/bin bash
source ./.env
rm -rf ./aws-cli
git clone --depth 1 --branch $AWS_CLI_VERSION https://github.com/aws/aws-cli.git
