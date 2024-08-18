#!/bin/bash

# Create the setup_test_db directory if it doesn't exist
# mkdir -p setup_test_db

cd setup_test_db
docker-compose up -d


# Download the schema and data SQL files
curl -o postgres-sakila-schema.sql https://raw.githubusercontent.com/ozzymcduff/sakila-sample-database-ports/master/postgres-sakila-db/postgres-sakila-schema.sql
curl -o postgres-sakila-data.sql https://raw.githubusercontent.com/ozzymcduff/sakila-sample-database-ports/master/postgres-sakila-db/postgres-sakila-data.sql

psql postgresql://postgres:postgres@localhost:5432/postgres -f postgres-sakila-schema.sql
psql postgresql://postgres:postgres@localhost:5432/postgres -f postgres-sakila-data.sql
