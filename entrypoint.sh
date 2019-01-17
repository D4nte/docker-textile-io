#!/usr/bin/env bash

function wallet_init() {
    echo "++ wallet_init";
    output=$(textile wallet init)
    mnemonics=$(echo "${output}" | head -n2 | tail -n1)
    echo "Save this! ${mnemonics}"
    export SEED=$(echo "${output}" | tail -n1)
}

function textile_init() {
    echo "++ textile_init";
    if [[ -n "${ARGS}" ]]; then
        textile init --repo-dir=/textile ${ARGS}
    else
        textile init --repo-dir=/textile --seed ${SEED}
    fi
}

function textile_start() {
    echo "++ textile_start";
    textile daemon --repo-dir=/textile
}

function main() {
    echo "++ main";
    if [[ -f /textile/textile ]]; then
        textile_start;
    elif [[ -n "${SEED}" ]] || [[ -n "${ARGS}" ]] ; then
        textile_init;
        textile_start;
    else
        wallet_init;
        textile_init;
        textile_start;
    fi
}

ARGS=""
while [[ -n "$1" ]] ; do
    case "$1" in
        --seed)
            shift;
            export SEED=$1
            export ARGS="${ARGS} --seed=${1}"
            shift;
            ;;
        *)
            export ARGS="${ARGS} $1"
            shift
            ;;
    esac
done

main;
