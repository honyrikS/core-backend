--liquibase formatted sql
--changeset artemov_i:init_#name.db# dbms:postgresql splitStatements:false stripComments:false
CREATE DATABASE ${name.db}
    WITH 
    OWNER = ${user.admin}
    ENCODING = 'UTF8'
    LC_COLLATE = 'ru_RU.UTF-8'
    LC_CTYPE = 'ru_RU.UTF-8'
	  TEMPLATE = template0
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE ROLE ${user.update} WITH
  NOLOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

CREATE ROLE ${user.connect} WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

ALTER ROLE ${user.connect} SET search_path TO public, ${user.table}, pg_catalog;
ALTER USER ${user.connect} WITH PASSWORD '${user.connect}';
