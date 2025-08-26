# For reading secrets
path "keys/data/puppet/*" {
  capabilities = ["read", "list"]
}

# For listing keys
path "keys/metadata/puppet/*" {
  capabilities = ["list"]
}