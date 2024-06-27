# Demo for ATLAS

## Runner the demo

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

## References

https://atlasgo.io/declarative/apply
