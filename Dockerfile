FROM mcr.microsoft.com/azure-cli

LABEL repository="https://github.com/PavanMudigonda/cucumber-azure-devops-sync"
LABEL homepage="https://github.com/PavanMudigonda/cucumber-azure-devops-sync"
LABEL maintainer="Pavan Mudigonda <nagapavankumar.mudigonda@tr.com>"

LABEL com.github.actions.name="Cucumber to Azure DevOps Sync"
LABEL com.github.actions.description="Cucumber to Azure DevOps Sync"
LABEL com.github.actions.icon="check-circle"
LABEL com.github.actions.color="green"

RUN apk add --no-cache build-base libffi-dev; \
    pip install --upgrade --force --no-cache-dir pip && \
    pip install --upgrade --force --no-cache-dir -r /action/requirements.txt; \
    apk del build-base libffi-dev

CMD "curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash"

COPY /python /action/

RUN pip install -r /action/requirements.txt
ENV ROOT=/action
RUN mkdir -p $ROOT
WORKDIR $ROOT
COPY ./entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]