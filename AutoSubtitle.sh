#!/bin/bash

# 1 - MAKE SURE YOU HAVE FILEBOT INSTALED AND CORRECTLY CONFIGURED ON YOUR MACHINE
# 2 - PUT THIS FILE INSIDE YOUR TV SHOW AND RUN IT
# 3 - IT CLEANS THE TV SHOW'S FOLDERS, REMOVING EVERY UNECESSARY FILE AND DOWNLOAD THE SUBTITLE FOR EACH ONE OF THEM USING FILEBOT

find ./ -iname "*.png" -exec bash -c 'rm "$0"' {} \;
find ./ -iname "*.jpg" -exec bash -c 'rm "$0"' {} \;
find ./ -iname "*.jpeg" -exec bash -c 'rm "$0"' {} \;
find ./ -iname "*.txt" -exec bash -c 'rm "$0"' {} \;
find ./ -iname "*.nfo" -exec bash -c 'rm "$0"' {} \;

# BRAZILIAN PORTUGUESE (IT FIXES SOME VARIATIONS OF THE 'PT-BR' LIKE 'PT', 'POB', 'POR' AND SO ON
find ./ -iname "*.pt.srt" -exec bash -c 'mv "$0" "${0%\.pt.srt}.srt"' {} \;
find ./ -iname "*.por.srt" -exec bash -c 'mv "$0" "${0%\.por.srt}.srt"' {} \;
find ./ -iname "*.pt-BR.srt" -exec bash -c 'mv "$0" "${0%\.pt-BR.srt}.por.srt"' {} \;
filebot -get-missing-subtitles -r ./ --lang pb --output srt --encoding utf8 \;
find ./ -iname "*.pob.srt" -exec bash -c 'mv "$0" "${0%\.pob.srt}.pb.srt"' {} \;
find ./ -iname "*.pb.srt" -exec bash -c 'mv "$0" "${0%\.pb.srt}.por.srt"' {} \;
find ./ -iname "*.PortugueseBR.srt" -exec bash -c 'mv "$0" "${0%\.PortugueseBR.srt}.por.srt"' {} \;

# ENGLISH (USE THIS AS REFERENCE FOR YOUR LANGUAGE)
find ./ -iname "*.en.srt" -exec bash -c 'mv "$0" "${0%\.en.srt}.eng.srt"' {} \;
filebot -get-missing-subtitles -r ./ --lang pb --output srt --encoding utf8 \;
find ./ -iname "*.eng.srt" -exec bash -c 'mv "$0" "${0%\.eng.srt}.en.srt"' {} \;

# QUIT TERMINAL
exit 0;
