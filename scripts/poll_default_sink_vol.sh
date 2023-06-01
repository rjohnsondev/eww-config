#!/usr/bin/env bash

# print initial val
pactl get-sink-volume @DEFAULT_SINK@ | head -n1 | sed "s/.* \([0-9]\+\)%.*/\1/"

# then subscribe
pactl subscribe | \
    rg --line-buffered 'change' | \
    xargs -n1 -d'\n' \
        sh -c 'pactl get-sink-volume @DEFAULT_SINK@ | head -n1 | sed "s/.* \([0-9]\+\)%.*/\1/"'

