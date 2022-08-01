#! /usr/bin/env sh

# List
ls -R

# ADD DOTNET TO PATH
cat << \EOF >> ~/.bash_profile
# Add .NET Core SDK tools
export PATH="$PATH:/root/.dotnet/tools"
EOF

# Gherkins Tool
GherkinSyncTool

# List
ls -R

