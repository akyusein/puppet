path "auth/approle/role/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "auth/approle/role/*/role-id" {
  capabilities = ["read"]
}

path "auth/approle/role/*/secret-id" {
  capabilities = ["create", "read"]
}

path "auth/token/create" {
  capabilities = ["create", "read", "update"]
}

path "sys/policies/acl/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}