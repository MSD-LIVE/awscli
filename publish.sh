# /user/env/bin bash
set -e

if [ "$1" = "" ]
then
  echo "Usage: $0 <AWS CLI version>"
  exit 1
fi

AWS_CLI_VERSION=$1
pip install -r requirements.txt

rm -rf ./aws-cli
git clone --depth 1 --branch $AWS_CLI_VERSION https://github.com/aws/aws-cli.git

cd aws-cli
pip install -r requirements.txt
flit build

cp dist/awscli-${AWS_CLI_VERSION}.tar.gz ../

cd ..
git add .
git commit -m "adds tar ball for AWS CLI version ${AWS_CLI_VERSION}"
