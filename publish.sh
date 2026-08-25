#!/usr/bin/env bash
set -e

if [ "$1" = "" ]
then
  echo "Usage: $0 <AWS CLI version>"
  exit 1
fi

AWS_CLI_VERSION=$1
python -m pip install -r requirements.txt

rm -rf ./aws-cli
git clone --depth 1 --branch "$AWS_CLI_VERSION" https://github.com/aws/aws-cli.git

cd aws-cli
python -m pip install -r requirements.txt
python -m build

wheel_path=$(find dist -maxdepth 1 -type f -name "awscli-${AWS_CLI_VERSION}-*.whl" -print -quit)
sdist_path=$(find dist -maxdepth 1 -type f -name "awscli-${AWS_CLI_VERSION}.tar.gz" -print -quit)

if [ -z "$wheel_path" ] || [ -z "$sdist_path" ]
then
  echo "Build did not produce the expected AWS CLI distributions for ${AWS_CLI_VERSION}" >&2
  exit 1
fi

python - "$wheel_path" <<'PY'
import sys
import zipfile

wheel_path = sys.argv[1]
with zipfile.ZipFile(wheel_path) as wheel:
  metadata_path = next(
    name for name in wheel.namelist() if name.endswith(".dist-info/METADATA")
  )
  metadata = wheel.read(metadata_path).decode("utf-8")

if "<=0.2.8" in metadata and "yaml.clib" in metadata:
  raise SystemExit(
    "Refusing to publish a wheel with ruamel.yaml.clib <= 0.2.8; "
    "use an AWS CLI release that supports Python 3.13."
  )
PY

mkdir -p ../dist
cp "$wheel_path" "$sdist_path" ../dist/

cd ..
git add .
git commit -m "adds build for AWS CLI version ${AWS_CLI_VERSION}"
git push
