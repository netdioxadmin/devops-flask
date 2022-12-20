FROM alpine:3.8

ENV USER_NAME flaskapp

ENV WORKDIR /var/flaskapp/

RUN mkdir $WORKDIR

RUN adduser -h $WORKDIR -s /bin/sh -D $USER_NAME

WORKDIR $WORKDIR

COPY .  .

RUN apk update & apk add python3

RUN pip3 install -r requirement.txt

RUN chown -R flaskapp:flaskapp $WORKDIR

USER flaskapp

EXPOSE 5000

ENTRYPOINT ["python3"]

CMD ["app.py"]
