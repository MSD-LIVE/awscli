# AWS CLI

This repo is a shell around AWS's CLI. As of v2, AWS no longer publishes it's CLI package to PyPi. This repo allows us to push our own copy of the AWS CLI package to PyPi so that we can use it in our CLI.

# .env

Use this file to configure which version of the AWS CLI to publish to our PyPi project.

# Publishing

To publish run `./publish.sh <awscli version number>`. For instance `./publish.sh 2.11.5`.

# Installing

To install, install from the GitHub raw URL. For instance: `pip install https://github.com/MSD-LIVE/awscli/raw/main/awscli-2.11.5.tar.gz`.
