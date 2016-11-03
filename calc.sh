#!/usr/bin/env bash
# Calculator using dmenu as an interface

dmenucmd="dmenu -p Calc $@"

# run dmenu calculator while the result is not empty
while : ; do
    # use contents of clipboard as option, pass into bc to be calculated
    result=$(xsel -o -b | $dmenucmd | xargs echo | bc 2>&1)
    if [[ $result ]]; then # if result is empty (the last one), don't copy it to clipboard
        printf "$result" | xsel -b
    fi
    [[ $result ]] || break # if result is empty, break from while loop
done
