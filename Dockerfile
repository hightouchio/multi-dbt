# Base image installs the various DBT versions as specified by the BUILD ARG
FROM python:3.8-slim as base

FROM base as builder

ARG VERSIONS=0.18,0.19

WORKDIR /app
COPY ./build.sh .
RUN ./build.sh $VERSIONS

# Next we pull the installed files from the base image into a new layer. This
# helps keep the size of the final image small
FROM base
WORKDIR /app
COPY --from=builder /app /app

