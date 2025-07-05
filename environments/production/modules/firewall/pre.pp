class my_firewall::pre {
  Firewall {
    require => undef,
  }
     firewall { '000 accept all icmp':
       proto  => 'icmp',
       action => 'accept',
     }
     firewall { '001 accept all to lo interface':
       proto   => 'all',
       iniface => 'lo',
       action  => 'accept',
     }
     firewall { '002 allow TCP port 8080':
       iniface     => 'ens33',
       proto       => 'tcp',
       dport       => '8080',
       action      => 'accept',
     }
     firewall { '003 accept related established rules':
       proto  => 'all',
       state  => ['RELATED', 'ESTABLISHED'],
       action => 'accept',
     }
   }
