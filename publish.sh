# /user/env/bin bash
source ./.env
pip install -r requirements.txt

rm -rf ./aws-cli
git clone --depth 1 --branch $AWS_CLI_VERSION https://github.com/aws/aws-cli.git

python update-package-name.py
cp .pypirc aws-cli/.pypirc

cd aws-cli
pip install -r requirements.txt
flit publish
