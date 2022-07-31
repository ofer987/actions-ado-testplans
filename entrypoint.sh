#! /usr/bin/env sh

Pickle-Features -FeatureDirectory ./features -DocumentationFormat JSON
ls
python /action/connect.py