class ssh_keys::manage {

  $user = 'akselyusein'

  $user_key = lookup('name' => 'ssh_pub')

  user { $user:
    ensure => present,
    home   => "/home/${user}",
    shell  => '/bin/bash',
    managehome => true,
    group => ['wheel'],
    append => true,
  }

  file { "/home/${user}/.ssh":
    ensure => 'directory',
    owner  => $user,
    group  => $user,
    mode   => '0700',
  }

  file { "/home/${user}/.ssh/authorized_keys":
    ensure  => 'present',
    owner   => $user,
    group   => $user,
    mode    => '0600',
    content => "${user_key}\n",
  }
}


