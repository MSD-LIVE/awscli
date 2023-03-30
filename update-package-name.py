import toml

pyproject_path = "aws-cli/pyproject.toml"

pyproject = None
with open(pyproject_path, "r") as pyproject_file:
    pyproject = toml.load(pyproject_file)

pyproject['project']['name'] = f"msdlive-awscli"
with open(pyproject_path, "w") as pyproject_file:
    toml.dump(pyproject, pyproject_file)
