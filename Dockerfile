# build binary in a different image
FROM golang:1.23 AS build

COPY main.go go.mod /src/

WORKDIR /src
ENV CGO_ENABLED=0
RUN go mod tidy && go build -o /echo-headers .

# create the final image
FROM gcr.io/distroless/static-debian12:nonroot
ENV GOTRACEBACK=single
LABEL name="echo-headers" \
    maintainer="abhinav1107" \
    summary="A webserver in Golang that prints all headers that the server gets"

COPY --from=build /echo-headers /bin/echo-headers
ENTRYPOINT ["echo-headers"]
