define jenkins::config_file (
  String $source_template,
  String $path,
  String $owner = 'jenkins',
  String $group = 'jenkins',
  String $mode  = '0644',
) {
  
  file { $path:
    ensure  => file,
    content => template($source_template),
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    notify  => Service['jenkins'],
  }
}
