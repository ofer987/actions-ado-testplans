FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine3.16

LABEL repository="https://github.com/PavanMudigonda/cucumber-azure-devops-sync"
LABEL homepage="https://github.com/PavanMudigonda/cucumber-azure-devops-sync"
LABEL maintainer="Pavan Mudigonda <mnpawan@gmail.com>"

LABEL com.github.actions.name="Cucumber to Azure DevOps Sync"
LABEL com.github.actions.description="Cucumber to Azure DevOps Sync"
LABEL com.github.actions.icon="check-circle"
LABEL com.github.actions.color="green"

RUN dotnet tool install -g Pickles.CommandLine --version 3.0.1

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3.12 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

RUN apk add --no-cache --upgrade expat libuuid

COPY python/requirements.txt /action/
RUN apk add --no-cache build-base libffi-dev; \
    pip install --upgrade --force --no-cache-dir pip && \
    pip install --upgrade --force --no-cache-dir -r /action/requirements.txt; \
    apk del build-base libffi-dev

COPY python/ /action/
COPY python/connect.py /action/

ENTRYPOINT ["python", "/action/connect.py"]
