FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine3.16

LABEL repository="https://github.com/PavanMudigonda/cucumber-azure-devops-sync"
LABEL homepage="https://github.com/PavanMudigonda/cucumber-azure-devops-sync"
LABEL maintainer="Pavan Mudigonda <nagapavankumar.mudigonda@tr.com>"

LABEL com.github.actions.name="Cucumber to Azure DevOps Sync"
LABEL com.github.actions.description="Cucumber to Azure DevOps Sync"
LABEL com.github.actions.icon="check-circle"
LABEL com.github.actions.color="green"

RUN dotnet tool install -g Pickles.CommandLine --version 3.0.1

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

RUN apk add --no-cache --upgrade expat libuuid

COPY src/requirements.txt /action/
RUN apk add --no-cache build-base libffi-dev; \
    pip install --upgrade --force --no-cache-dir pip && \
    pip install --upgrade --force --no-cache-dir -r /action/requirements.txt; \
    apk del build-base libffi-dev

COPY /src /action/

CMD "pip install -r /action/src/requirements.txt"
CMD "export PATH="$PATH:/root/.dotnet/tools""
ENV ROOT=/action
RUN mkdir -p $ROOT
WORKDIR $ROOT
COPY ./entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]