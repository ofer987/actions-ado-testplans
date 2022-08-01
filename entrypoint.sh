#! /usr/bin/env sh

# List
ls -R

# DOTNET BUILD
dotnet build ./dotnet/GherkinSyncTool.sln

# RUN APP
dotnet ./dotnet/GherkinSyncTool/bin/Debug/*/GherkinSyncTool.dll

# List
ls -R

