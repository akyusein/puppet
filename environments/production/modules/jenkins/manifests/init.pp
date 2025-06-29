class jenkins {

  service { 'jenkins':
    ensure     => running,
    enable     => true,
    hasrestart => true,
  }

  
  jenkins::config_file { 'main_config':
    source_template => 'jenkins/config.xml.erb',
    path            => '/var/lib/jenkins/config.xml',
    
  }

  jenkins::config_file { 'git_hooks_config':
    source_template => 'jenkins/plugins_git_hooks.erb',
    path            => '/var/lib/jenkins/jenkins.plugins.git.GitHooksConfiguration.xml',
  }
}


