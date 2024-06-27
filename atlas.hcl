variable "destructive" {
  type    = bool
  default = false
}

env "local" {
  diff {
    skip {
      drop_schema = !var.destructive
      drop_table  = !var.destructive

    }
  }
}
