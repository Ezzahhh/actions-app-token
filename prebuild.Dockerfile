FROM python:slim-bullseye

RUN apt-get update \
    && apt-get install gcc -y \
    && apt-get clean

RUN pip install \
    cryptography \
    github3.py \
    jwcrypto \
    pyjwt

COPY token_getter.py app/
COPY entrypoint.sh app/
RUN chmod u+x app/entrypoint.sh
WORKDIR /app

CMD /app/entrypoint.sh
