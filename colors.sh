#!/usr/bin/env bash
#
#    This is based on the script found here:
#     https://gist.githubusercontent.com/sdeaton2/8450564/raw/2c9a8121c1fd4d4eee3dae9f90994705f993629b/colors.sh
#
#    Each line is the color code of one foreground color, out of 17
#    (default + 16 escapes), followed by a test use of that color
#    on all nine background colors (default + 8 escapes).
#

text="xYz"; # Some test text

echo -e "\n                40m   41m   42m   43m   44m   45m   46m   47m";

for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
           '  36m' '1;36m' '  37m' '1;37m'; do
    FG=${FGs// /}
    echo -en " $FGs \033[$FG  ${text}  ";
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m; do
        echo -en "$EINS \033[$FG\033[${BG} ${text} \033[0m";
    done
    echo;
done
echo;
