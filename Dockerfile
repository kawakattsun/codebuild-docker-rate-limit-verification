FROM public.ecr.aws/bitnami/golang:1.14.12-debian-10-r11 as build
WORKDIR /go/src/app
ADD . /go/src/app
RUN go build -o /go/bin/app

FROM gcr.io/distroless/base-debian10
COPY --from=build /go/bin/app /
CMD ["/app"]
