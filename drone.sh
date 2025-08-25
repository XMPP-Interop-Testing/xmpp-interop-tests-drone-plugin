#!/bin/bash

ENTRYCMD=()

ENTRYCMD+=('/sbin/entrypoint.sh')

if [ "$PLUGIN_DOMAIN" != "" ]; then
    ENTRYCMD+=("--domain=$PLUGIN_DOMAIN")
fi

if [ "$PLUGIN_HOST" != "" ]; then
    ENTRYCMD+=("--host=$PLUGIN_HOST")
fi

if [ "$PLUGIN_TIMEOUT" != "" ]; then
    ENTRYCMD+=("--timeout=$PLUGIN_TIMEOUT")
fi

if [ "$PLUGIN_ADMINACCOUNTUSERNAME" != "" ]; then
    ENTRYCMD+=("--adminAccountUsername=$PLUGIN_ADMINACCOUNTUSERNAME")
fi

if [ "$PLUGIN_ADMINACCOUNTPASSWORD" != "" ]; then
    ENTRYCMD+=("--adminAccountPassword=$PLUGIN_ADMINACCOUNTPASSWORD")
fi

if [ "$PLUGIN_DISABLEDTESTS" != "" ]; then
    ENTRYCMD+=("--disabledTests=$PLUGIN_DISABLEDTESTS")
fi

if [ "$PLUGIN_DISABLEDSPECIFICATIONS" != "" ]; then
    ENTRYCMD+=("--disabledSpecifications=$PLUGIN_DISABLEDSPECIFICATIONS")
fi

echo "Running: ${ENTRYCMD[*]}"

"${ENTRYCMD[@]}"