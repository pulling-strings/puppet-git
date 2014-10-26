# Misc operating system family params
class git::params {
  case $::osfamily {
    'Debian': {
      $package = 'git-core'
      $path = ['/usr/bin/', '/bin']
      $bin= '/usr/bin/git'
      $test = '/usr/bin/test'
    }
    'FreeBSD': {
      $package = 'git'
      $path = ['/usr/local/bin/', '/usr/sbin/']
      $bin = '/usr/local/bin/git'
      $test = '/bin/test'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::osfamily}")
    }
  }
}
