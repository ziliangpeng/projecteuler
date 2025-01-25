#!/bin/bash

assert() {
    if [ "$1" == "$2" ]; then
        printf "\033[32mCorrect\033[0m\n"
    else
        printf "\033[31mIncorrect\033[0m\n"
    fi
}

for file in *.go; do
    if [[ $file =~ ^([0-9]+)\.go$ ]]; then
        number=${BASH_REMATCH[1]}
        echo "Problem $number:"
    else continue
    fi

    if [ ! -f "$number.yes" ]; then
        printf "\033[37mnull\033[0m\n"
        continue
    fi

    # find a way to time it
    result=$(go run $number.go prime.go | tail -n 1)
    expected=$(cat $number.yes)
    assert $expected $result
done


