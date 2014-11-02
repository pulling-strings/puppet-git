# Git managment module
class git($scm_user=false, $scm_email=false, $user=false) {

  include git::params

  ensure_resource('package',$::git::params::package,{'ensure' => 'present'})
}
