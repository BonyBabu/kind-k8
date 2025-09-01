ARG PLATFORM

FROM --platform=${PLATFORM} golang:1.25.0-alpine3.22 AS builder

ENV GOSUMDB=off

RUN go install sigs.k8s.io/kind@v0.29.0

FROM --platform=${PLATFORM} docker:dind

COPY --from=builder /go/ /usr/local/go

ENV PATH="/usr/local/go/bin:${PATH}"

USER root


