# AWS CLI

This repo is a shell around AWS's CLI. As of v2, AWS no longer publishes it's CLI package to PyPi. This repo allows us to depend on AWS CLI in our Poetry package for the MSD-LIVE CLI.

# Publishing

To publish run `./publish.sh <awscli version number>`. For instance `./publish.sh 2.11.5`.

publish.sh clones the specified version of the aws cli from git, builds it, then copies the built .tar.gz into this repo's dist folder. Our msdlive-cli (https://github.com/MSD-LIVE/msdlive-cli) (? fill in blank here for how msdlive cli uses this new version...?) 

# Using as a Dependency

You can use the raw GitHub URL as a dependency. For example:

```
awscli = {url = "https://github.com/MSD-LIVE/awscli/raw/main/dist/awscli-2.17.55-py3-none-any.whl"}
```
