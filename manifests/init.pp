# Git managment module
class git($scm_user=false, $scm_email=false, $user=false) {

  include git::params
  validate_string($scm_user)
  validate_string($scm_email)
  validate_string($user)

  ensure_resource('package',$::git::params::package,{'ensure' => 'present'})

  class { 'git::configure':
    scm_user  => $scm_user,
    scm_email => $scm_email
  }

}
