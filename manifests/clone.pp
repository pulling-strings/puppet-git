define git::clone($url,$dst,$owner) {
	$to = basename($dst)
  exec{"clone $name":
    command => "git clone $url $to",
    cwd  => dirname($dst),
    user    => $owner,
    path    => ['/usr/bin/'],
    unless  => "test -d $dst"
  }
}
