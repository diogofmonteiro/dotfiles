#!/usr/bin/env bash

workspaces() {
    name=1
    for monitor in $(bspc query -M); do
        bspc monitor "${monitor}" -n "$name" -d '1' '2' '3' '4' '5' '6'
        ((name++))
    done
}

workspaces
