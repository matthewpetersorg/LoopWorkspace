#!/bin/zsh

# define variables used by more than one script
#   variables are:
#      message_file
#      archive_dir
#      translation_dir
#      projects
#      LANGUAGES

# include this file in each script using
#   source Scripts/define_commont.sh

# define name of file used to save the commit message and title for pull requests
message_file="xlate_message_file.txt"

# define the branch names used by the translation scripts
archive_dir="archive_translations"
translation_dir="translations"
test_lw_dir="dev_translations_test"

# define the languages used by the translation scripts
LANGUAGES=(ar cs ru en zh-Hans nl fr de it nb pl es ja pt-BR vi da sv fi ro tr he sk hi)

# define the projects used by the translation scripts
projects=( \
    LoopKit:AmplitudeService:dev \
    LoopKit:CGMBLEKit:dev \
    LoopKit:dexcom-share-client-swift:dev \
    loopandlearn:DanaKit:dev \
    LoopKit:G7SensorKit:main \
    LoopKit:LibreTransmitter:main \
    LoopKit:LogglyService:dev \
    LoopKit:Loop:dev \
    LoopKit:LoopKit:dev \
    LoopKit:LoopOnboarding:dev \
    LoopKit:LoopSupport:dev \
    LoopKit:MinimedKit:main \
    LoopKit:NightscoutRemoteCGM:dev \
    LoopKit:NightscoutService:dev \
    LoopKit:OmniBLE:dev \
    LoopKit:OmniKit:main \
    LoopKit:RileyLinkKit:dev \
    LoopKit:TidepoolService:dev \
    )
