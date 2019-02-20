FROM postgres:latest
USER postgres
COPY northwind.sql /docker-entrypoint-initdb.d/northwind.sql
COPY mk_db.sh /docker-entrypoint-initdb.d/northwind.sql