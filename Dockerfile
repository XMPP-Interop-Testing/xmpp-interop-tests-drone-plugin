ARG SINTSE_VERSION="main"

FROM ghcr.io/xmpp-interop-testing/xmpp_interop_tests:${SINTSE_VERSION}

COPY --chmod=0755 drone.sh /sbin/drone.sh

ENTRYPOINT ["/sbin/drone.sh"]
