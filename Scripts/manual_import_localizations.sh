#!/bin/zsh

# This script imports localizations from xliff files into the users local clone of LoopWorkspace
# You must be in the LoopWorkspace folder

# Fetch translations from Lokalise before running this script
# ./Scripts/manual_download_from_lokalise.sh

# Then execute script:
# ./Scripts/manual_import_localizations.sh

set -e
set -u

source Scripts/define_common.sh

for project in ${projects}; do
  echo "Prepping $project"
  IFS=":" read user dir branch <<< "$project"
  echo "parts = $user $dir $branch"
  cd $dir
  git checkout $branch
  git pull
  git branch -D ${translation_dir} || true
  git checkout -b ${translation_dir} || true
  cd -
done

# Build Loop
set -o pipefail && time xcodebuild -workspace LoopWorkspace.xcworkspace -scheme 'LoopWorkspace' build | xcpretty

# Apply translations
foreach file in xliff_in/*.xliff
  echo "**********************************"
  echo " importing ${file}"
  echo "**********************************"
  xcodebuild -workspace LoopWorkspace.xcworkspace -scheme "LoopWorkspace" -importLocalizations -localizationPath $file
end

echo "Continue by reviewing the differences for each submodule with command:"
echo "./Scripts/manual_review_translations.sh"