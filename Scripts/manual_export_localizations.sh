#!/bin/zsh

# This script creates the xliff files suitable to upload to lokalise

# You must be in the LoopWorkspace folder before executing with:
# ./Scripts/manual_export_localizations.sh

set -e
set -u

source Scripts/define_common.sh

argstring="${LANGUAGES[@]/#/-exportLanguage }"
IFS=" "; args=( $=argstring )

xcodebuild -scheme LoopWorkspace -exportLocalizations -localizationPath xclocs $args

mkdir -p xliff_out
find xclocs -name '*.xliff' -exec cp {} xliff_out \;

