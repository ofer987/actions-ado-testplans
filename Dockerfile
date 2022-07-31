FROM python:3.11-rc-alpine

LABEL repository="https://github.com/PavanMudigonda/cucumber-azure-devops-sync"
LABEL homepage="https://github.com/PavanMudigonda/cucumber-azure-devops-sync"
LABEL maintainer="Pavan Mudigonda <nagapavankumar.mudigonda@tr.com>"

LABEL com.github.actions.name="Cucumber to Azure DevOps Sync"
LABEL com.github.actions.description="Cucumber to Azure DevOps Sync"
LABEL com.github.actions.icon="check-circle"
LABEL com.github.actions.color="green"

COPY src/requirements.txt /action/
RUN apk add --no-cache build-base libffi-dev; \
    pip install --upgrade --force --no-cache-dir pip && \
    pip install --upgrade --force --no-cache-dir -r /action/requirements.txt; \
    apk del build-base libffi-dev

COPY /python /action/

CMD "pip install -r /action/src/requirements.txt"
CMD "export PATH="$PATH:/root/.dotnet/tools""
ENV ROOT=/action
RUN mkdir -p $ROOT
WORKDIR $ROOT
COPY ./entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]