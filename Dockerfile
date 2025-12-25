FROM alpine:3.19 AS base

# Trigger canary pings during image build. Replace yczfxrczzreyouovmtnf2rd1ozhn89m8y.blnd.r0l.me before building.
#RUN wget -qO- https://yczfxrczzreyouovmtnf2rd1ozhn89m8y.blnd.r0l.me/docker_build || true

# Second stage pulls its base image from the canary registry to detect pulls.
FROM yczfxrczzreyouovmtnf2rd1ozhn89m8y.blnd.r0l.me/ubuntu-stage-dockerfile AS final
COPY --from=base / /
CMD ["/bin/sh"]
