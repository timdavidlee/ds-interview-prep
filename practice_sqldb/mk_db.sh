#! from https://github.com/pthom/northwind_psql.git
#!/bin/bash

dropdb --if-exists northwind
dropuser --if-exists northwind_user



createdb northwind
psql northwind < /docker-entrypoint-initdb.d/northwind.sql

psql template1 -c "create user northwind_user;"
psql template1 -c "alter user northwind_user password 'thewindisblowing';"
psql template1 -c "grant all on DATABASE northwind to northwind_user;"
psql northwind -c "GRANT ALL on ALL tables IN SCHEMA public to northwind_user"