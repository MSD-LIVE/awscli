# AWS CLI

This repo is a shell around AWS's CLI. As of v2, AWS no longer publishes it's CLI package to PyPi. This repo allows us to depend on AWS CLI in our Poetry package for the MSD-LIVE CLI.

# .env

Use this file to configure which version of the AWS CLI to publish to our PyPi project.

# Publishing

To publish run `./publish.sh <awscli version number>`. For instance `./publish.sh 2.11.5`.

# Installing

To install with `pip`, install from the GitHub raw URL. For instance: `pip install https://github.com/MSD-LIVE/awscli/raw/main/awscli-2.11.5.tar.gz`.
