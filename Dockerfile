# docker build --tag django-jet .
# docker run --rm -it -v $(pwd):/workspace -e UID=$(id -u) -e GID=$(id -g) django-jet /bin/bash
# inside:
#       rm -fr node_modules && rm -fr package-lock.json && npm cache clean --force
#       yarn install --immutable
#       gulp build


FROM python:3.8.2
RUN pip install Django==3.0.6


RUN apt-get update && apt-get install -y curl build-essential apt-transport-https gnupg2 git \
		ca-certificates gettext npm

# Global install gulp with very old version of node, all newer fail
RUN npm install --global n
RUN n 8.2
RUN npm install --global gulp-cli yarn

WORKDIR /workspace
