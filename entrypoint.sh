#!/usr/bin/env bash

function wallet_init() {
    output=$(textile wallet init)
    mnemonics=$(echo "${output}" | head -n2 | tail -n1)
    echo "Save this! ${mnemonics}"
    export SEED=$(echo "${output}" | tail -n1)
}

function textile_init() {
    if [[ -n ${SEED} ]]; then
        textile init --repo-dir=/textile/ --seed ${SEED}
    else
        echo "Internal error: seed not found"
        exit 1
    fi
}

function textile_start() {
    textile daemon --repo-dir=/textile
}

case "$1" in
    --seed)
        shift;
        export SEED=$1
        shift;
        ;;
    *)
        wallet_init;
        shift;
        ;;
esac

textile_init;
textile_start;
