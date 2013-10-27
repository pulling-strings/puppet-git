# clone git repos
define git::clone($url,$dst,$owner,$timeout=360) {

  $to = basename($dst)

  exec{"clone ${name}":
    command => "git clone ${url} ${to}",
    cwd     => dirname($dst),
    user    => root,
    path    => ['/usr/bin/'],
    unless  => "test -d ${dst}",
    notify  => Exec["chown ${name}"],
    require => Package['git-core'],
    timeout => $timeout
  }

  exec{"chown ${name}":
    command     => "chown ${owner} ${dst} -R",
    user        => root,
    path        => ['/bin/'],
    refreshonly => true
  }
}
