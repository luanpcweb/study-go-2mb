FROM golang AS build
WORKDIR /app

COPY . .

RUN go build -o main .

FROM scratch

COPY --from=build /app/main /bin/main

ENTRYPOINT ["/bin/main"]
