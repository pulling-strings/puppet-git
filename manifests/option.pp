# configure git
define git::option($value) {
    exec {"set git ${name} ${value}":
      command     => "git config --global ${name} ${value}",
      path        => $::git::params::path,
      user        => 'root',
      environment => "HOME=${git::configure::home}",
      require     => Package[$::git::params::package],
      unless      => "git config --get ${name}"
    }
}


