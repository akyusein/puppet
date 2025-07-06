node 'sporadica.test.com' {
  class { 'jenkins': }
  class { 'my_firewall::pre': }
}

