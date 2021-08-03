ARG BUILD_FROM
ARG BUILD_ARCH
ARG ENET_MQTT_VERSION

FROM ${BUILD_FROM} as builder-amd64
ARG ENET_MQTT_VERSION
ADD https://github.com/YoloDev/enet-mqtt/releases/download/v${ENET_MQTT_VERSION}/enet-mqtt-x86_64 /usr/bin/enet-mqtt

FROM ${BUILD_FROM} as builder-aarch64
ARG ENET_MQTT_VERSION
ADD https://github.com/YoloDev/enet-mqtt/releases/download/v${ENET_MQTT_VERSION}/enet-mqtt-aarch64 /usr/bin/enet-mqtt

FROM builder-${BUILD_ARCH}
RUN apt-get update \
  && apt-get install -y --no-install-recommends pwgen \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
  io.hass.name="${BUILD_NAME}" \
  io.hass.description="${BUILD_DESCRIPTION}" \
  io.hass.arch="${BUILD_ARCH}" \
  io.hass.type="addon" \
  io.hass.version=${BUILD_VERSION} \
  maintainer="Aleksander Heintz <alxandr@alxandr.me>" \
  org.opencontainers.image.title="${BUILD_NAME}" \
  org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
  org.opencontainers.image.vendor="YoloDev" \
  org.opencontainers.image.authors="Aleksander Heintz <alxandr@alxandr.me>" \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.url="https://github.com/YoloDev" \
  org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
  org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
  org.opencontainers.image.created=${BUILD_DATE} \
  org.opencontainers.image.revision=${BUILD_REF} \
  org.opencontainers.image.version=${BUILD_VERSION}
