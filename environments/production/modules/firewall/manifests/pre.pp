class my_firewall::pre {
  include firewall

  firewall { '000 accept all icmp':
    proto  => 'icmp',
    jump => 'accept',
  }

  firewall { '001 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    jump  => 'accept',
  }

  firewall { '002 allow TCP port 8080':
    proto  => 'tcp',
    dport  => 8080,
    iniface => 'ens33',
    jump => 'accept',
  }

  firewall { '003 accept related established rules':
    proto  => 'all',
    state  => ['RELATED', 'ESTABLISHED'],
    jump => 'accept',
  }
}
