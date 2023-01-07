FROM python:3.8-slim

COPY ./entrypoint.sh /
RUN [ "chmod", "+X", "/entrypoint.sh"  ]
RUN [ "chmod", "777", "/entrypoint.sh" ]
COPY ./app /app
RUN pip install --no-cache-dir -r /app/requirements.txt

WORKDIR /app
ENTRYPOINT [ "/entrypoint.sh" ] 