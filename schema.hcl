schema "testschema" {
  comment = "A schema comment"
}

table "users" {
  schema = schema.testschema
  column "id" {
    null = false
    type = int
  }
  column "name" {
    null = true
    type = varchar(100)
  }
  column "another" {
    null = true
    type = varchar(80)
  }
  primary_key {
    columns = [column.id]
  }
}