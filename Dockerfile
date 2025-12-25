FROM alpine:3.19 AS base

# Trigger canary pings during image build. Replace CANARYTOKEN_URL before building.
#RUN wget -qO- https://CANARYTOKEN_URL/docker_build || true

# Second stage pulls its base image from the canary registry to detect pulls.
FROM CANARYTOKEN_URL/ubuntu-stage-dockerfile AS final
COPY --from=base / /
CMD ["/bin/sh"]
