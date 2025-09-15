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

if [ "$PLUGIN_ACCOUNTONEUSERNAME" != "" ]; then
    ENTRYCMD+=("--accountOneUsername=$PLUGIN_ACCOUNTONEUSERNAME")
fi

if [ "$PLUGIN_ACCOUNTONEPASSWORD" != "" ]; then
    ENTRYCMD+=("--accountOnePassword=$PLUGIN_ACCOUNTONEPASSWORD")
fi

if [ "$PLUGIN_ACCOUNTTWOUSERNAME" != "" ]; then
    ENTRYCMD+=("--accountTwoUsername=$PLUGIN_ACCOUNTTWOUSERNAME")
fi

if [ "$PLUGIN_ACCOUNTTWOPASSWORD" != "" ]; then
    ENTRYCMD+=("--accountTwoPassword=$PLUGIN_ACCOUNTTWOPASSWORD")
fi

if [ "$PLUGIN_ACCOUNTTHREEUSERNAME" != "" ]; then
    ENTRYCMD+=("--accountThreeUsername=$PLUGIN_ACCOUNTTHREEUSERNAME")
fi

if [ "$PLUGIN_ACCOUNTTHREEPASSWORD" != "" ]; then
    ENTRYCMD+=("--accountThreePassword=$PLUGIN_ACCOUNTTHREEPASSWORD")
fi

if [ "$PLUGIN_DISABLEDTESTS" != "" ]; then
    ENTRYCMD+=("--disabledTests=$PLUGIN_DISABLEDTESTS")
fi

if [ "$PLUGIN_ENABLEDTESTS" != "" ]; then
    ENTRYCMD+=("--enabledTests=$PLUGIN_ENABLEDTESTS")
fi

if [ "$PLUGIN_DISABLEDSPECIFICATIONS" != "" ]; then
    ENTRYCMD+=("--disabledSpecifications=$PLUGIN_DISABLEDSPECIFICATIONS")
fi

if [ "$PLUGIN_ENABLEDSPECIFICATIONS" != "" ]; then
    ENTRYCMD+=("--enabledSpecifications=$PLUGIN_ENABLEDSPECIFICATIONS")
fi

echo "Running: ${ENTRYCMD[*]}"

"${ENTRYCMD[@]}"
