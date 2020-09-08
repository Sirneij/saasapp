FROM python:3.8.2-alpine
LABEL maintainer="John Idogun <sirneij@gmail.com>"

ENV INSTALL_PATH /diceeyes
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .
RUN pip install --editable .

CMD gunicorn -b 0.0.0.0:5000 --access-logfile - "diceeyes.app:create_app()"
