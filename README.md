# Demo for ATLAS

## Empty database demo

```sh
$ docker compose up -d
[+] Running 3/3
 ✔ Container demo-atlas-sql-postgres-1      Running
 ✔ Container demo-atlas-sql-postgres-dev-1  Running
 ✔ Container demo-atlas-sql-atlas-1         Started


$ docker compose run atlas schema apply --to file:///project/schema.hcl --url postgres://youruser:yourpassword@postgres:5432/yourdb?sslmode=disable --dev-url postgres://youruser:yourpassword@postgres-dev:5432/dev?sslmode=disable --env local --dry-run
-- Planned Changes:
-- Drop schema named "public"
DROP SCHEMA "public" CASCADE;
-- Add new schema named "testschema"
CREATE SCHEMA "testschema";
-- Set comment to schema: "testschema"
COMMENT ON SCHEMA "testschema" IS 'A schema comment';
-- Create "users" table
CREATE TABLE "testschema"."users" (
  "id" integer NOT NULL,
  "name" character varying(100) NULL,
  "another" character varying(80) NULL,
  PRIMARY KEY ("id")
);


$ docker compose run atlas schema apply --to file:///project/schema.hcl --url postgres://youruser:yourpassword@postgres:5432/yourdb?sslmode=disable --dev-url postgres://youruser:yourpassword@postgres-dev:5432/dev?sslmode=disable --env local --auto-approve
-- Planned Changes:
-- Drop schema named "public"
DROP SCHEMA "public" CASCADE;
-- Add new schema named "testschema"
CREATE SCHEMA "testschema";
-- Set comment to schema: "testschema"
COMMENT ON SCHEMA "testschema" IS 'A schema comment';
-- Create "users" table
CREATE TABLE "testschema"."users" (
  "id" integer NOT NULL,
  "name" character varying(100) NULL,
  "another" character varying(80) NULL,
  PRIMARY KEY ("id")
);

$ docker compose run atlas schema apply --to file:///project/schema.hcl --url postgres://youruser:yourpassword@postgres:5432/yourdb?sslmode=disable --dev-url postgres://youruser:yourpassword@postgres-dev:5432/dev?sslmode=disable --env local --dry-run
Schema is synced, no changes to be made
```

## Renaming a column demo

If we decide to rename a column, Atlas will ask for instructon : DROP/CREATE or RENAME :

```sh
$ docker compose run atlas schema apply --to file:///project/schema_v2.hcl --url postgres://youruser:yourpassword@postgres:5432/yourdb?sslmode=disable --dev-url postgres://youruser:yourpassword@postgres-dev:5432/dev?sslmode=disable --env local --auto-approve
? Did you rename "users" column from "another" to "renamed":
  ▸ Yes
    No
-- Planned Changes:
-- Rename a column from "another" to "renamed"
ALTER TABLE "testschema"."users" RENAME COLUMN "another" TO "renamed";
```

# References

https://atlasgo.io/declarative/apply
