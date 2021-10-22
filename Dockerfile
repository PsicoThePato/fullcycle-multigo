FROM golang as compiler

WORKDIR /app
COPY ./app/* /app/
RUN go build /app/hello.go

FROM scratch
WORKDIR /app
COPY --from=compiler /app/hello .
CMD ["./hello"]
