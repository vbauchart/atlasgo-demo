variable "destructive" {
  type    = bool
  default = false
}

env "local" {
    // Define the URL of the database which is managed
  // in this environment.
  url = "postgres://youruser:yourpassword@postgres:5432/yourdb?sslmode=disable"

  // Define the URL of the Dev Database for this environment
  // See: https://atlasgo.io/concepts/dev-database
  dev = "postgres://youruser:yourpassword@postgres-dev:5432/dev?sslmode=disable"

  diff {
    skip {
      drop_schema = !var.destructive
      drop_table  = !var.destructive

    }
  }
}
