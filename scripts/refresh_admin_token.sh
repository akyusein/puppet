#! /bin/bash

vault policy write approle-admin approle-admin-policy.hcl

export VAULT_TOKEN=$(vault token create -policy=approle-admin -format=json | jq -r '.auth.client_token')