# Micro-frontend Root Initializer

- **In an iTerm window**:
  - Run `bash start.sh {app names you'd like to run}` to run all default apps. (i.e.: `bash start.sh meal grocery`)
  - This script will run `account`, `root`, and `header` apps by default. (refer: [defaultApps.sh](./defaultApps.sh))
  - This script will check for any missing dependencies and will try to install them. (refer: [installDependencies.sh](./installDependencies.sh))

> Required dependencies:
> nvm: https://github.com/nvm-sh/nvm
> jq: https://stedolan.github.io/jq
> ttab: https://github.com/mklement0/ttab
