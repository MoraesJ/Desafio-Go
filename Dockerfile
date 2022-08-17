FROM golang:1.18 AS build

WORKDIR /usr/src/app

COPY go.mod *.go ./

RUN go build golang .

FROM scratch

WORKDIR /

COPY --from=build /usr/src/app/golang /golang

CMD [ "./golang" ]
