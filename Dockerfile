ARG SINTSE_VERSION="main"

LABEL org.opencontainers.image.source https://github.com/XMPP-Interop-Testing/xmpp-interop-tests-drone-plugin

FROM ghcr.io/xmpp-interop-testing/xmpp_interop_tests:${SINTSE_VERSION}

COPY --chmod=0755 drone.sh /sbin/drone.sh

ENTRYPOINT ["/sbin/drone.sh"]
