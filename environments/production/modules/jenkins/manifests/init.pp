class jenkins {

  package { 'java-11-openjdk':
    ensure => installed,
  }

  file { '/etc/yum.repos.d/jenkins.repo':
    ensure  => file,
    content => template('jenkins/jenkins.repo.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Exec['import-jenkins-key'],
}

  exec { 'import-jenkins-key':
    command     => '/usr/bin/rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key',
    path        => ['/usr/bin'],
    refreshonly => true,
  }

  package { 'jenkins':
    ensure  => installed,
    require => [Package['java-11-openjdk'], Exec['import-jenkins-key']],
  }


  service { 'jenkins':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['jenkins'],
  }


  jenkins::config_file { 'main_config':
    source_template => 'jenkins/config.xml.erb',
    path            => '/var/lib/jenkins/config.xml',
    group           => 'jenkins',

  }

  jenkins::config_file { 'git_hooks_config':
    source_template => 'jenkins/plugins_git_hooks.erb',
    path            => '/var/lib/jenkins/jenkins.plugins.git.GitHooksConfiguration.xml',
  }

  jenkins::config_file { 'hudson_triggers':
    source_template => 'jenkins/hudson.triggers.SCMTrigger.xml.erb',
    path            => '/var/lib/jenkins/hudson.triggers.SCMTrigger.xml',
  }

}
