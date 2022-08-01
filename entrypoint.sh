#! /usr/bin/env bash

# ADD DOTNET TO PATH
cat << \EOF >> ~/.bash_profile
# Add .NET Core SDK tools
export PATH="$PATH:/root/.dotnet/tools"
EOF

# Gherkins Tool
GherkinSyncTool


