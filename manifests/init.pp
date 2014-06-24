# Git managment module
class git($scm_user=false, $scm_email=false, $user=false) {

  validate_string($scm_user)
  validate_string($scm_email)
  validate_string($user)

  if(!defined(Package['git-core'])){
    package { 'git-core':
      ensure => present
    }
  }

  class { 'git::configure':
    scm_user  => $scm_user,
    scm_email => $scm_email
  }

}
