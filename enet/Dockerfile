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
  && apt-get install -y pwgen \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY rootfs /
