FROM microsoft/mssql-server-linux:2017-latest
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=local_password
RUN mkdir -p /app/sql
WORKDIR /app/sql
COPY . .