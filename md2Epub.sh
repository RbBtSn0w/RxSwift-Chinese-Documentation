#!/bin/bash

#---------------pandoc env checking------------------#

if [ `command -v pandoc` ];then
    echo 'pandoc already'
else
    echo 'pandoc need install'

    if [ `command -v brew` ];then
        echo 'Homebrew already'
    else
        echo 'Homebrew need install'

        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    brew install pandoc
fi

#---------------pandoc config------------------#

pandoc SUMMARY.md --from markdown -o RxSwift-Chinese-Documentation.epub --to epub3 -s --fail-if-warnings
