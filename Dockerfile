FROM ghcr.io/ledermann/rails-base-builder:3.1.2-alpine as Builder


FROM ghcr.io/ledermann/rails-base-final:3.1.2-alpine
LABEL maintainer="georg@ledermann.dev"

# Workaround for BuildKit to trigger Builder's ONBUILDs to finish
COPY --from=Builder /etc/alpine-release /tmp/dummy

# Add Alpine packages
RUN apk add --no-cache imagemagick

USER app

# Start up
CMD ["docker/startup.sh"]
