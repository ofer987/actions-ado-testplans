FROM mcr.microsoft.com/dotnet/sdk:6.0

LABEL repository="https://github.com/PavanMudigonda/cucumber-azure-devops-sync"
LABEL homepage="https://github.com/PavanMudigonda/cucumber-azure-devops-sync"
LABEL maintainer="Pavan Mudigonda <nagapavankumar.mudigonda@tr.com>"

LABEL com.github.actions.name="Cucumber to Azure DevOps Sync"
LABEL com.github.actions.description="Cucumber to Azure DevOps Sync"
LABEL com.github.actions.icon="check-circle"
LABEL com.github.actions.color="green"

COPY /dotnet /action/

ENV ROOT=/action
RUN mkdir -p $ROOT
WORKDIR $ROOT
COPY ./entrypoint.sh /entrypoint.sh
RUN dotnet tool install --global GherkinSyncTool
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]