FROM alpine:3.13.3

COPY dist/ /var/my_app

WORKDIR /var/my_app

EXPOSE 80

CMD ./server_app.exe
