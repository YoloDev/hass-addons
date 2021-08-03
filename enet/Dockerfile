ARG BUILD_FROM
ARG BUILD_ARCH
ARG ENET_MQTT_VERSION

FROM ${BUILD_FROM} as builder-amd64
ADD https://github.com/YoloDev/enet-mqtt/releases/download/v${ENET_MQTT_VERSION}/enet-mqtt-x86_64 /usr/bin/enet-mqtt

FROM ${BUILD_FROM} as builder-aarch64
ADD https://github.com/YoloDev/enet-mqtt/releases/download/v${ENET_MQTT_VERSION}/enet-mqtt-aarch64 /usr/bin/enet-mqtt

FROM builder-${BUILD_ARCH}
# RUN apt-get update \
#   && apt-get install -y ca-certificates tzdata \
#   && rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY rootfs /
