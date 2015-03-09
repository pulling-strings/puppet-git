# clone git repos
define git::clone(
  $url,
  $dst,
  $owner,
  $unless = "${::git::params::test} -d ${dst}/.git",
  $timeout=360) {

  $to = basename($dst)

  ensure_resource('package',$::git::params::package,{'ensure' => 'present'})

  exec{"clone ${name}":
    command => "git clone ${url} ${to}",
    cwd     => dirname($dst),
    user    => root,
    path    => $::git::params::path,
    unless  => $unless,
    notify  => Exec["chown ${name}"],
    require => Package[$::git::params::package],
    timeout => $timeout
  }

  exec{"chown ${name}":
    command     => "chown -R ${owner}:${owner} ${dst}",
    user        => root,
    path        => $::git::params::path,
    refreshonly => true
  }
}
