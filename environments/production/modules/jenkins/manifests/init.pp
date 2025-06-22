class jenkins (
  String $config_file_path = '/var/lib/jenkins/config.xml',
) {

  file { $config_file_path:
    ensure  => file,
    content => template('jenkins/config.xml.erb'),
    owner   => 'jenkins',
    group   => 'jenkins',
    mode    => '0644',
    notify  => Service['jenkins'],
  }

  service { 'jenkins':
    ensure     => running,
    enable     => true,
    hasrestart => true,
  }
}

