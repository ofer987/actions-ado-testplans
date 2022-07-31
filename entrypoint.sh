#! /usr/bin/env bash

Pickle-Features -FeatureDirectory ./features -DocumentationFormat JSON
ls
python /action/connect.py