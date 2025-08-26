#! /bin/bash

vault policy write puppet-policy puppet-policy.hcl

if role_id=$(vault read -format=json auth/approle/role/puppet-role/role-id | jq -r '.data.role_id'); then
   echo "AppRole already exists."

else
   vault write auth/approle/role/puppet-role \
        token_policies="puppet-policy" \
        token_ttl=1h \
        token_max_ttl=4h \
        token_renewable=true
fi

SECRET_ID_FILE="/etc/puppetlabs/puppet/secret_id"
if [ -s "$SECRET_ID_FILE" ]; then
    secret_id=$(sudo cat "$SECRET_ID_FILE")
else
    secret_id=$(vault write -f -format=json auth/approle/role/puppet-role/secret-id | jq -r '.data.secret_id')
    sudo su -c "echo $secret_id > $SECRET_ID_FILE"
    sudo su -c "chmod 600 $SECRET_ID_FILE"

fi

token=$(vault write -format=json auth/approle/login role_id="$role_id" secret_id="$secret_id" | jq -r '.auth.client_token')

sudo su -c "echo $token > /etc/puppetlabs/puppet/token"