#! /usr/bin/env sh

# Set Path
cd /action/dotnet

# List
ls -R

# DOTNET BUILD
dotnet build GherkinSyncTool.sln

# RUN APP
dotnet ./GherkinSyncTool/bin/Debug/*/GherkinSyncTool.dll
