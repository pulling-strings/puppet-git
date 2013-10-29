# clone git repos
define git::clone($url,$dst,$owner,$timeout=360) {

  $to = basename($dst)

  if(!defined(Package['git-core'])){
    package{'git-core':
      ensure  => present
    }
  }

  exec{"clone ${name}":
    command => "git clone ${url} ${to}",
    cwd     => dirname($dst),
    user    => root,
    path    => ['/usr/bin/'],
    unless  => "/usr/bin/test -d ${dst}/.git",
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
