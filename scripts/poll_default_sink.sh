#!/usr/bin/env bash

# print initial val
pactl list sinks | rg $(pactl get-default-sink) -A1 | rg "nick" | sed "s/.*\"\(.*\)\".*/\1/g"

# then subscribe
pactl subscribe | \
    rg --line-buffered 'change' | \
    xargs -n1 -d'\n' \
        sh -c 'pactl list sinks | rg $(pactl get-default-sink) -A1 | rg "nick" | sed "s/.*\"\(.*\)\".*/\1/g"'

